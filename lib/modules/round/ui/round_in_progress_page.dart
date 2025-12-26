import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/notifications/api/local_notifier.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/ui/widgets/round_header.dart';
import 'package:apparence_kit/modules/round/ui/widgets/scorecard_grid.dart';
import 'package:apparence_kit/modules/round/ui/widgets/score_input_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Alias for the generated provider
const activeRoundNotifierProvider = activeRoundProvider;

class RoundInProgressPage extends ConsumerStatefulWidget {
  final String? roundId;

  const RoundInProgressPage({
    super.key,
    this.roundId,
  });

  @override
  ConsumerState<RoundInProgressPage> createState() => _RoundInProgressPageState();
}

class _RoundInProgressPageState extends ConsumerState<RoundInProgressPage> {
  final _scrollController = ScrollController();
  ForgottenRoundHandler? _forgottenRoundHandler;

  @override
  void initState() {
    super.initState();
    // Register handler for forgotten round notifications
    _forgottenRoundHandler = ForgottenRoundHandler(_showForgottenRoundDialog);

    // Load round if roundId is provided
    if (widget.roundId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(activeRoundNotifierProvider.notifier).loadRound(widget.roundId!);
      });
    }
  }

  @override
  void dispose() {
    _forgottenRoundHandler?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeRoundNotifierProvider);

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colors.onBackground),
          onPressed: () => _handleBack(context),
        ),
        title: Text(
          'Ronda en curso',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          if (state is ActiveRoundStateActive && state.isSaving)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, ActiveRoundState state) {
    return switch (state) {
      ActiveRoundStateInitial() => const _LoadingView(),
      ActiveRoundStateLoading() => const _LoadingView(),
      final ActiveRoundStateActive activeState => _ActiveView(
        state: activeState,
        scrollController: _scrollController,
        onHoleTap: (hole) => _openScoreSheet(context, hole),
        onIncrement: (hole) => _incrementStrokes(hole),
        onDecrement: (hole) => _decrementStrokes(hole),
        onGpsTap: () => _toggleGps(),
        onRefresh: () => _refresh(),
        onFinish: () => _showFinishDialog(context),
        savingError: activeState.savingError,
      ),
      ActiveRoundStateFinished(:final roundId, :final summary) => Builder(
        builder: (ctx) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/round-summary', extra: {'roundId': roundId, 'summary': summary});
          });
          return const _LoadingView();
        },
      ),
      ActiveRoundStateDiscarded() => Builder(
        builder: (ctx) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final tr = Translations.of(context).round_in_progress;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(tr.round_discarded)),
            );
            context.go('/');
          });
          return const _LoadingView();
        },
      ),
      ActiveRoundStateError(:final message, :final roundId) => _ErrorView(
        message: message,
        onRetry: () {
          if (roundId != null) {
            ref.read(activeRoundNotifierProvider.notifier).loadRound(roundId);
          }
        },
        onBack: () => context.pop(),
      ),
    };
  }

  void _handleBack(BuildContext context) {
    final state = ref.read(activeRoundNotifierProvider);
    if (state is ActiveRoundStateActive) {
      _showExitConfirmation(context);
    } else {
      context.pop();
    }
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Salir de la ronda?'),
        content: const Text(
          'Tu progreso se guardara y podras continuar mas tarde.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: const Text('Salir'),
          ),
        ],
      ),
    );
  }

  void _openScoreSheet(BuildContext context, int hole) {
    final state = ref.read(activeRoundNotifierProvider);
    if (state is! ActiveRoundStateActive) return;

    final score = state.round.scores[hole - 1];
    ScoreInputSheet.show(
      context: context,
      score: score,
      onSave: ({int? strokes, int? putts, int? penalties}) {
        ref.read(activeRoundNotifierProvider.notifier).updateScore(
          hole: hole,
          strokes: strokes,
          putts: putts,
          penalties: penalties,
        );
      },
    );
  }

  void _incrementStrokes(int hole) {
    ref.read(activeRoundNotifierProvider.notifier).incrementStrokes(hole);
  }

  void _decrementStrokes(int hole) {
    ref.read(activeRoundNotifierProvider.notifier).decrementStrokes(hole);
  }

  void _toggleGps() async {
    final state = ref.read(activeRoundNotifierProvider);
    if (state is! ActiveRoundStateActive) return;

    final newValue = !state.round.gpsEnabled;
    final success = await ref.read(activeRoundNotifierProvider.notifier).setGpsEnabled(newValue);

    if (mounted) {
      if (success) {
        final tr = Translations.of(context).round_in_progress;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(newValue ? tr.gps_enabled : tr.gps_disabled),
            duration: const Duration(seconds: 2),
          ),
        );
      } else if (newValue) {
        // GPS enable was blocked (likely due to distance)
        final tr = Translations.of(context).select_course;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(tr.gps_too_far_error),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _refresh() async {
    HapticFeedback.mediumImpact();
    await ref.read(activeRoundNotifierProvider.notifier).refresh();
  }

  void _showFinishDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => _FinishRoundOptionsDialog(
        onSave: () {
          Navigator.pop(dialogContext);
          _showSaveRoundDialog(context);
        },
        onDiscard: () {
          Navigator.pop(dialogContext);
          _showDiscardConfirmDialog(context);
        },
      ),
    );
  }

  void _showSaveRoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _FinishRoundDialog(
        onFinish: (notes) {
          ref.read(activeRoundNotifierProvider.notifier).finishRound(notes: notes);
        },
      ),
    );
  }

  void _showDiscardConfirmDialog(BuildContext context) {
    final tr = Translations.of(context).round_in_progress;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.discard_title),
        content: Text(tr.discard_message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(tr.back),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              ref.read(activeRoundNotifierProvider.notifier).discardRound();
            },
            child: Text(tr.discard_action),
          ),
        ],
      ),
    );
  }

  void _showForgottenRoundDialog() {
    if (!mounted) return;

    final state = ref.read(activeRoundNotifierProvider);
    if (state is! ActiveRoundStateActive) return;

    showDialog(
      context: context,
      builder: (dialogContext) => _ForgottenRoundDialog(
        courseName: state.round.course.name,
        onEnd: () {
          Navigator.pop(dialogContext);
          ref.read(activeRoundNotifierProvider.notifier).finishRound();
        },
        onContinue: () {
          Navigator.pop(dialogContext);
          ref.read(activeRoundNotifierProvider.notifier).snoozeReminder();
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ActiveView extends StatelessWidget {
  final ActiveRoundStateActive state;
  final ScrollController scrollController;
  final void Function(int hole) onHoleTap;
  final void Function(int hole) onIncrement;
  final void Function(int hole) onDecrement;
  final VoidCallback onGpsTap;
  final Future<void> Function() onRefresh;
  final VoidCallback onFinish;
  final String? savingError;

  const _ActiveView({
    required this.state,
    required this.scrollController,
    required this.onHoleTap,
    required this.onIncrement,
    required this.onDecrement,
    required this.onGpsTap,
    required this.onRefresh,
    required this.onFinish,
    this.savingError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with course info and score summary
        RoundHeader(
          round: state.round,
          onGpsTap: onGpsTap,
        ),
        // Error banner
        if (savingError != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.red.shade100,
            child: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red.shade700, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Error al guardar: $savingError',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        // Scorecard grid
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ScorecardGrid(
              round: state.round,
              currentHole: state.currentHole,
              scrollController: scrollController,
              onHoleTap: onHoleTap,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ),
        ),
        // Bottom button
        _BottomButton(
          onFinish: onFinish,
          isSaving: state.isSaving,
        ),
      ],
    );
  }
}

class _BottomButton extends StatelessWidget {
  final VoidCallback onFinish;
  final bool isSaving;

  const _BottomButton({
    required this.onFinish,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.background,
        border: Border(
          top: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: isSaving ? null : onFinish,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Finalizar Ronda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final VoidCallback onBack;

  const _ErrorView({
    required this.message,
    required this.onRetry,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: context.colors.error,
          ),
          const SizedBox(height: 24),
          Text(
            'Error',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onBack,
                child: const Text('Volver'),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: onRetry,
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FinishRoundOptionsDialog extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onDiscard;

  const _FinishRoundOptionsDialog({
    required this.onSave,
    required this.onDiscard,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).round_in_progress;
    return AlertDialog(
      title: Text(tr.finish_title),
      content: Text(tr.finish_message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(Translations.of(context).common.cancel),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          onPressed: onDiscard,
          child: Text(tr.discard_action),
        ),
        FilledButton(
          onPressed: onSave,
          child: Text(tr.save_action),
        ),
      ],
    );
  }
}

class _FinishRoundDialog extends StatefulWidget {
  final void Function(String? notes) onFinish;

  const _FinishRoundDialog({required this.onFinish});

  @override
  State<_FinishRoundDialog> createState() => _FinishRoundDialogState();
}

class _FinishRoundDialogState extends State<_FinishRoundDialog> {
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Finalizar ronda?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Una vez finalizada, no podras editar los resultados.'),
          const SizedBox(height: 16),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notas (opcional)',
              hintText: 'Agrega notas sobre la ronda...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            final notes = _notesController.text.trim();
            widget.onFinish(notes.isNotEmpty ? notes : null);
          },
          child: const Text('Finalizar'),
        ),
      ],
    );
  }
}

class _ForgottenRoundDialog extends StatelessWidget {
  final String courseName;
  final VoidCallback onEnd;
  final VoidCallback onContinue;

  const _ForgottenRoundDialog({
    required this.courseName,
    required this.onEnd,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).forgotten_round;
    // Replace placeholder since slang doesn't support this format
    final body = tr.dialog_body.replaceAll('{courseName}', courseName);

    return AlertDialog(
      title: Text(tr.dialog_title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: onContinue,
          child: Text(tr.action_continue),
        ),
        FilledButton(
          onPressed: onEnd,
          child: Text(tr.action_end),
        ),
      ],
    );
  }
}
