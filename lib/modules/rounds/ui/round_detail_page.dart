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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateFormat.format(round.startTime),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onBackground.withValues(alpha: 0.6),
                  ),
                ),
                if (round.tee != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Tee: ${round.tee!.name}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onBackground.withValues(alpha: 0.6),
                    ),
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
                fontWeight: FontWeight.bold,
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
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colors.onSurface.withValues(alpha: 0.1),
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

  const _StatItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: highlight ? context.colors.primary : null,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withValues(alpha: 0.6),
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
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colors.onSurface.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            // Header row
            _ScorecardHeaderRow(tr: tr),
            const Divider(height: 1),
            // Front 9
            ...round.frontNine.map((score) => _ScorecardRow(score: score)),
            // Out row
            _ScorecardTotalRow(
              label: tr.out,
              par: round.outPar,
              strokes: round.outStrokes,
            ),
            const Divider(height: 1),
            // Back 9
            ...round.backNine.map((score) => _ScorecardRow(score: score)),
            // In row
            _ScorecardTotalRow(
              label: tr.kIn,
              par: round.inPar,
              strokes: round.inStrokes,
            ),
            const Divider(height: 1),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              tr.hole,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              tr.par,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              tr.score,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              Translations.of(context).rounds.result,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
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
    final strokes = score.strokes;
    final par = score.par;
    final holeNumber = score.holeNumber;
    final diff = strokes != null ? strokes - par : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: holeNumber.isEven
            ? context.colors.surface
            : context.colors.background.withValues(alpha: 0.5),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              holeNumber.toString(),
              style: context.textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              par.toString(),
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              strokes?.toString() ?? '-',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: strokes != null ? FontWeight.w600 : null,
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
    final diff = strokes != null ? strokes! - par : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: isTotal
          ? context.colors.primary.withValues(alpha: 0.1)
          : context.colors.surface,
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              par.toString(),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 36,
            child: Text(
              strokes?.toString() ?? '-',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
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
    if (diff == null || scoreName.isEmpty) {
      return Text(
        '-',
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colors.onSurface.withValues(alpha: 0.5),
        ),
        textAlign: TextAlign.center,
      );
    }

    Color backgroundColor;
    Color textColor;

    if (diff! <= -2) {
      // Eagle or better - gold
      backgroundColor = const Color(0xFFFFD700).withValues(alpha: 0.2);
      textColor = const Color(0xFFB8860B);
    } else if (diff == -1) {
      // Birdie - green
      backgroundColor = const Color(0xFF4CAF50).withValues(alpha: 0.15);
      textColor = const Color(0xFF2E7D32);
    } else if (diff == 0) {
      // Par - neutral
      backgroundColor = context.colors.primary.withValues(alpha: 0.1);
      textColor = context.colors.primary;
    } else if (diff == 1) {
      // Bogey - light orange
      backgroundColor = const Color(0xFFFF9800).withValues(alpha: 0.12);
      textColor = const Color(0xFFE65100);
    } else {
      // Double bogey or worse - red
      backgroundColor = const Color(0xFFF44336).withValues(alpha: 0.12);
      textColor = const Color(0xFFC62828);
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
    if (diff == null) {
      return Text(
        '-',
        style: context.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      );
    }

    Color textColor;
    if (diff! < 0) {
      textColor = const Color(0xFF2E7D32);
    } else if (diff! > 0) {
      textColor = const Color(0xFFE65100);
    } else {
      textColor = context.colors.onSurface;
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
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
