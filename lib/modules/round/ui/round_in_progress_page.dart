import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/styled_dialog.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/notifications/api/local_notifier.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/ui/widgets/round_header.dart';
import 'package:apparence_kit/modules/round/ui/widgets/score_input_sheet.dart';
import 'package:apparence_kit/modules/round/ui/widgets/scorecard_grid.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/voice_caddy_fab.dart';
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
            fontWeight: FontWeight.w600,
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
      floatingActionButton: state is ActiveRoundStateActive
          ? const VoiceCaddyFab()
          : null,
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
    final tr = Translations.of(context).round_in_progress;
    final commonTr = Translations.of(context).common;
    final colors = context.colors;
    showStyledDialog(
      context: context,
      icon: Icon(
        Icons.exit_to_app,
        size: 48,
        color: colors.primary,
      ),
      title: tr.exit_title,
      content: tr.exit_message,
      actions: [
        StyledDialogAction.secondary(
          label: commonTr.cancel,
          onTap: () => Navigator.pop(context),
        ),
        StyledDialogAction.primary(
          label: tr.exit_action,
          onTap: () {
            Navigator.pop(context);
            context.pop();
          },
        ),
      ],
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
    final colors = context.colors;
    showStyledDialog(
      context: context,
      icon: Icon(
        Icons.delete_forever,
        size: 48,
        color: colors.error,
      ),
      title: tr.discard_title,
      content: tr.discard_message,
      actions: [
        StyledDialogAction.secondary(
          label: tr.back,
          onTap: () => Navigator.pop(context),
        ),
        StyledDialogAction.destructive(
          label: tr.discard_action,
          onTap: () {
            Navigator.pop(context);
            ref.read(activeRoundNotifierProvider.notifier).discardRound();
          },
        ),
      ],
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
                      fontWeight: FontWeight.w600,
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
    final tr = Translations.of(context);
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
            tr.common.error,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
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
                child: Text(tr.round_in_progress.back),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: onRetry,
                child: Text(tr.round_in_progress.retry),
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
    final colors = context.colors;
    return StyledDialog(
      icon: Icon(
        Icons.flag_outlined,
        size: 48,
        color: colors.primary,
      ),
      title: tr.finish_title,
      content: tr.finish_message,
      actions: [
        StyledDialogAction.secondary(
          label: Translations.of(context).common.cancel,
          onTap: () => Navigator.pop(context),
        ),
        StyledDialogAction.primary(
          label: tr.save_action,
          onTap: onSave,
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
    final tr = Translations.of(context).round_in_progress;
    final commonTr = Translations.of(context).common;
    final colors = context.colors;
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141A24).withValues(alpha: 0.90),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.flag_outlined,
                size: 48,
                color: colors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                tr.finish_title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr.finish_message,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _notesController,
                style: TextStyle(color: colors.onSurface),
                decoration: InputDecoration(
                  labelText: tr.notes_label,
                  labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
                  hintText: tr.notes_hint,
                  hintStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
                  filled: true,
                  fillColor: const Color(0xFF141A24).withValues(alpha: 0.85),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colors.primary.withValues(alpha: 0.6)),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(12),
                          child: Center(
                            child: Text(
                              commonTr.cancel,
                              style: context.textTheme.titleSmall?.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors.primary.withValues(alpha: 0.9),
                            colors.primary,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            final notes = _notesController.text.trim();
                            widget.onFinish(notes.isNotEmpty ? notes : null);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Center(
                            child: Text(
                              tr.finish_action,
                              style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
    final colors = context.colors;
    // Replace placeholder since slang doesn't support this format
    final body = tr.dialog_body.replaceAll('{courseName}', courseName);

    return StyledDialog(
      icon: Icon(
        Icons.timer_outlined,
        size: 48,
        color: colors.warning,
      ),
      title: tr.dialog_title,
      content: body,
      actions: [
        StyledDialogAction.secondary(
          label: tr.action_continue,
          onTap: onContinue,
        ),
        StyledDialogAction.primary(
          label: tr.action_end,
          onTap: onEnd,
        ),
      ],
    );
  }
}
