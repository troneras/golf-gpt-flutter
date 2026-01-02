import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/styled_dialog.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/notifications/api/local_notifier.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/ui/widgets/round_header.dart';
import 'package:apparence_kit/modules/round/ui/widgets/score_input_sheet.dart';
import 'package:apparence_kit/modules/round/ui/widgets/scorecard_grid.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Alias for the generated provider
const activeRoundNotifierProvider = activeRoundProvider;

class RoundInProgressPage extends ConsumerStatefulWidget {
  final String? roundId;
  final bool showFinishDialog;

  const RoundInProgressPage({
    super.key,
    this.roundId,
    this.showFinishDialog = false,
  });

  @override
  ConsumerState<RoundInProgressPage> createState() => _RoundInProgressPageState();
}

class _RoundInProgressPageState extends ConsumerState<RoundInProgressPage> {
  final _scrollController = ScrollController();
  ForgottenRoundHandler? _forgottenRoundHandler;
  bool _hasShownFinishDialog = false;

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
    final colors = context.colors;
    final tr = Translations.of(context).round_in_progress;

    // Show finish dialog automatically if requested and round is active
    if (widget.showFinishDialog &&
        !_hasShownFinishDialog &&
        state is ActiveRoundStateActive) {
      _hasShownFinishDialog = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showFinishDialog(context);
        }
      });
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // Back gesture triggers finish round dialog
        if (state is ActiveRoundStateActive) {
          _showFinishDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          backgroundColor: colors.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            tr.title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.onBackground,
            ),
          ),
          centerTitle: true,
          actions: [
            if (state is ActiveRoundStateActive && state.isSaving)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.primary,
                  ),
                ),
              ),
          ],
        ),
        body: _buildBody(context, state),
      ),
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
            // Navigate after dialog is dismissed
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                context.go('/');
              }
            });
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

class _ActiveView extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final tr = Translations.of(context).round_in_progress;

    return Column(
      children: [
        // Voice caddy card - primary action at top
        _VoiceCaddyCard(),
        // Header with course info and score summary
        RoundHeader(
          round: state.round,
          onGpsTap: onGpsTap,
        ),
        // Error banner with muted colors per design system
        if (savingError != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: 0.15),
              border: Border(
                bottom: BorderSide(
                  color: colors.error.withValues(alpha: 0.3),
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: colors.error, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${tr.error_saving}: $savingError',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colors.error,
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
            color: colors.primary,
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

/// Voice caddy card - primary action for talking to caddy during round.
class _VoiceCaddyCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final userState = ref.watch(userStateNotifierProvider);
    final tr = Translations.of(context).voice_caddy.home_card;
    final isConnected = userState.user.isGptConnected;

    return GestureDetector(
      onTap: () => _onTap(context, ref, isConnected),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          // Level 2 prominent glass for primary action
          color: isConnected
              ? colors.primary.withValues(alpha: 0.15)
              : const Color(0xFF3A3A3A).withValues(alpha: 0.90),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isConnected
                ? colors.primary.withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isConnected
                    ? colors.primary
                    : colors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
                boxShadow: isConnected
                    ? [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.4),
                          blurRadius: 8,
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isConnected ? Icons.headphones : Icons.mic_none,
                size: 24,
                color: isConnected ? colors.onPrimary : colors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isConnected ? tr.connected_title : tr.not_connected_title,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onBackground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isConnected ? tr.connected_subtitle : tr.not_connected_subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colors.textTertiary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isConnected
                    ? colors.primary
                    : Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isConnected ? tr.connected_cta : tr.not_connected_cta,
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isConnected ? colors.onPrimary : colors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTap(
    BuildContext context,
    WidgetRef ref,
    bool isConnected,
  ) async {
    // Read providers synchronously before async operations to avoid
    // using ref after the widget may have been unmounted
    final analyticsApi = ref.read(analyticsApiProvider);
    final voiceCaddyNotifier = ref.read(voiceCaddyProvider.notifier);

    if (isConnected) {
      await analyticsApi.logEvent('voice_caddy_card_opened', {
        'source': 'round_in_progress',
      });
      await voiceCaddyNotifier.openChatGPT();
    } else {
      await analyticsApi.logEvent('voice_caddy_card_setup', {
        'source': 'round_in_progress',
      });
      if (context.mounted) {
        context.push('/voice-caddy-setup');
      }
    }
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
    final colors = context.colors;
    final tr = Translations.of(context).round_in_progress;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: isSaving ? null : onFinish,
          child: Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isSaving
                  ? null
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.primary.withValues(alpha: 0.9),
                        colors.primary,
                      ],
                    ),
              color: isSaving ? Colors.white.withValues(alpha: 0.08) : null,
              boxShadow: isSaving
                  ? null
                  : [
                      BoxShadow(
                        color: colors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Center(
              child: isSaving
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.textDisabled,
                      ),
                    )
                  : Text(
                      tr.finish_round,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onPrimary,
                      ),
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
    final colors = context.colors;
    final tr = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: 40,
              color: colors.error,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            tr.common.error,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.onBackground,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.textTheme.bodyMedium?.copyWith(
              color: colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ghost button for back
              GestureDetector(
                onTap: onBack,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Text(
                    tr.round_in_progress.back,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Primary CTA for retry
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                  child: Text(
                    tr.round_in_progress.retry,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onPrimary,
                    ),
                  ),
                ),
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
        StyledDialogAction.destructive(
          label: tr.discard_action,
          onTap: onDiscard,
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
          color: const Color(0xFF3A3A3A).withValues(alpha: 0.90),
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
                  fillColor: const Color(0xFF3A3A3A).withValues(alpha: 0.85),
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
