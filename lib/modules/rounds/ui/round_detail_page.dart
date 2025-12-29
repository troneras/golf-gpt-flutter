import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/hole_score.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/repositories/round_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'round_detail_page.g.dart';

@riverpod
Future<Round> roundDetail(Ref ref, String roundId) async {
  final repository = ref.read(roundRepositoryProvider);
  final round = await repository.getRound(roundId);

  // Track analytics
  final ageDays = DateTime.now().difference(round.startTime).inDays;
  ref.read(analyticsApiProvider).logEvent('round_detail_viewed', {
    'round_id': roundId,
    'age_days': ageDays,
  });

  return round;
}

class RoundDetailPage extends ConsumerWidget {
  final String roundId;

  const RoundDetailPage({super.key, required this.roundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roundAsync = ref.watch(roundDetailProvider(roundId));
    final tr = Translations.of(context).rounds;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(tr.detail_title),
        backgroundColor: context.colors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: roundAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: context.colors.error),
                  const SizedBox(height: 16),
                  Text(error.toString(), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => ref.invalidate(roundDetailProvider(roundId)),
                    child: Text(Translations.of(context).common.retry),
                  ),
                ],
              ),
            ),
          ),
          data: (round) => _RoundDetailContent(round: round),
        ),
      ),
    );
  }
}

class _RoundDetailContent extends StatelessWidget {
  final Round round;

  const _RoundDetailContent({required this.round});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = Translations.of(context).round_in_progress;
    final dateFormat = DateFormat.yMMMd(Localizations.localeOf(context).toString());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with course info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  round.course.name,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateFormat.format(round.startTime),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
                if (round.tee != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: round.tee!.displayColor,
                          shape: BoxShape.circle,
                          border: round.tee!.isLightColor
                              ? Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  width: 1,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        round.tee!.name,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          // Summary stats
          _SummaryStats(round: round),
          const SizedBox(height: 16),
          // Scorecard
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Scorecard',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _Scorecard(round: round, tr: tr),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SummaryStats extends StatelessWidget {
  final Round round;

  const _SummaryStats({required this.round});

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).round_summary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // Level 1 Matte Glass per design system
          color: const Color(0xFF141A24).withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(
              label: tr.total_strokes,
              value: round.totalStrokes?.toString() ?? '-',
              highlight: true,
            ),
            _StatItem(
              label: 'vs Par',
              value: _formatRelativeToPar(round.scoreRelativeToPar),
              relativeToPar: round.scoreRelativeToPar,
            ),
            _StatItem(
              label: tr.putts,
              value: round.totalPutts?.toString() ?? '-',
            ),
            if (round.durationMinutes != null)
              _StatItem(
                label: tr.duration,
                value: _formatDuration(round.durationMinutes!),
              ),
          ],
        ),
      ),
    );
  }

  String _formatRelativeToPar(int? relativeToPar) {
    if (relativeToPar == null) return '-';
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) return '${hours}h ${mins}m';
    return '${mins}m';
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;
  final int? relativeToPar;

  const _StatItem({
    required this.label,
    required this.value,
    this.highlight = false,
    this.relativeToPar,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Determine value color based on relativeToPar (muted per design system)
    Color valueColor;
    if (highlight) {
      valueColor = colors.primary;
    } else if (relativeToPar != null) {
      if (relativeToPar! < 0) {
        valueColor = colors.success;
      } else if (relativeToPar! > 0) {
        valueColor = colors.warning;
      } else {
        valueColor = colors.onBackground;
      }
    } else {
      valueColor = colors.onBackground;
    }

    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: colors.textTertiary,
          ),
        ),
      ],
    );
  }
}

class _Scorecard extends StatelessWidget {
  final Round round;
  final TranslationsRoundInProgressEs tr;

  const _Scorecard({required this.round, required this.tr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          // Level 1 Matte Glass per design system
          color: const Color(0xFF141A24).withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Header row
            _ScorecardHeaderRow(tr: tr),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
            // Front 9
            ...round.frontNine.map((score) => _ScorecardRow(score: score)),
            // Out row
            _ScorecardTotalRow(
              label: tr.out,
              par: round.outPar,
              strokes: round.outStrokes,
            ),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
            // Back 9
            ...round.backNine.map((score) => _ScorecardRow(score: score)),
            // In row
            _ScorecardTotalRow(
              label: tr.kIn,
              par: round.inPar,
              strokes: round.inStrokes,
            ),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
            // Total row
            _ScorecardTotalRow(
              label: tr.total,
              par: round.totalPar,
              strokes: round.totalStrokes,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScorecardHeaderRow extends StatelessWidget {
  final TranslationsRoundInProgressEs tr;

  const _ScorecardHeaderRow({required this.tr});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              tr.hole,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              tr.par,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              tr.score,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              Translations.of(context).rounds.result,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScorecardRow extends StatelessWidget {
  final HoleScore score;

  const _ScorecardRow({required this.score});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strokes = score.strokes;
    final par = score.par;
    final holeNumber = score.holeNumber;
    final diff = strokes != null ? strokes - par : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // Alternating rows with subtle variation per dark-first design
        color: holeNumber.isEven
            ? Colors.white.withValues(alpha: 0.02)
            : Colors.transparent,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              holeNumber.toString(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.onBackground,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              par.toString(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              strokes?.toString() ?? '-',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: strokes != null ? FontWeight.w600 : null,
                color: strokes != null ? colors.onBackground : colors.textDisabled,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: _ScoreResultBadge(diff: diff, scoreName: score.displayScoreName),
          ),
        ],
      ),
    );
  }
}

class _ScorecardTotalRow extends StatelessWidget {
  final String label;
  final int par;
  final int? strokes;
  final bool isTotal;

  const _ScorecardTotalRow({
    required this.label,
    required this.par,
    required this.strokes,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final diff = strokes != null ? strokes! - par : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: isTotal
          ? colors.primary.withValues(alpha: 0.1)
          : Colors.white.withValues(alpha: 0.03),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              par.toString(),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              strokes?.toString() ?? '-',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: strokes != null ? colors.onBackground : colors.textDisabled,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: _DiffBadge(diff: diff),
          ),
        ],
      ),
    );
  }
}

class _ScoreResultBadge extends StatelessWidget {
  final int? diff;
  final String scoreName;

  const _ScoreResultBadge({required this.diff, required this.scoreName});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (diff == null || scoreName.isEmpty) {
      return Text(
        '-',
        style: context.textTheme.bodySmall?.copyWith(
          color: colors.textDisabled,
        ),
        textAlign: TextAlign.center,
      );
    }

    // Muted colors per design system - contextual, not alarming
    Color backgroundColor;
    Color textColor;

    if (diff! <= -2) {
      // Eagle or better - muted amber (B8956A from design system)
      backgroundColor = const Color(0xFFB8956A).withValues(alpha: 0.2);
      textColor = const Color(0xFFB8956A);
    } else if (diff == -1) {
      // Birdie - muted green (6BCF9B from design system)
      backgroundColor = colors.success.withValues(alpha: 0.15);
      textColor = colors.success;
    } else if (diff == 0) {
      // Par - primary accent
      backgroundColor = colors.primary.withValues(alpha: 0.1);
      textColor = colors.primary;
    } else if (diff == 1) {
      // Bogey - muted amber/warning
      backgroundColor = colors.warning.withValues(alpha: 0.12);
      textColor = colors.warning;
    } else {
      // Double bogey or worse - muted red (CF6B6B from design system)
      backgroundColor = colors.error.withValues(alpha: 0.12);
      textColor = colors.error;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        scoreName,
        style: context.textTheme.bodySmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DiffBadge extends StatelessWidget {
  final int? diff;

  const _DiffBadge({required this.diff});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (diff == null) {
      return Text(
        '-',
        style: context.textTheme.bodyMedium?.copyWith(
          color: colors.textDisabled,
        ),
        textAlign: TextAlign.center,
      );
    }

    // Muted colors per design system
    Color textColor;
    if (diff! < 0) {
      textColor = colors.success;
    } else if (diff! > 0) {
      textColor = colors.warning;
    } else {
      textColor = colors.onBackground;
    }

    String text;
    if (diff == 0) {
      text = 'E';
    } else if (diff! > 0) {
      text = '+$diff';
    } else {
      text = '$diff';
    }

    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
