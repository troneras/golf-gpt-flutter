import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:flutter/material.dart';

/// Header widget displaying course name, tee, and running score.
/// Operational screen = minimal glass, readability focused per design system.
class RoundHeader extends StatelessWidget {
  final Round round;
  final VoidCallback? onGpsTap;

  const RoundHeader({
    super.key,
    required this.round,
    this.onGpsTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = Translations.of(context).round_in_progress;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Operational screen: minimal glass, solid dark background
        color: colors.surface,
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      round.course.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onBackground,
                      ),
                    ),
                    if (round.tee != null) ...[
                      const SizedBox(height: 2),
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
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            round.tee!.name,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (onGpsTap != null)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: round.gpsEnabled
                        ? colors.primary.withValues(alpha: 0.15)
                        : Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: onGpsTap,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      round.gpsEnabled ? Icons.gps_fixed : Icons.gps_off,
                      size: 20,
                      color: round.gpsEnabled
                          ? colors.primary
                          : colors.textDisabled,
                    ),
                    tooltip: round.gpsEnabled ? tr.gps_enabled : tr.gps_disabled,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          // Running score summary
          _ScoreSummary(round: round),
        ],
      ),
    );
  }
}

class _ScoreSummary extends StatelessWidget {
  final Round round;

  const _ScoreSummary({required this.round});

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).round_in_progress;
    final holesPlayed = round.holesPlayed;
    final totalStrokes = round.computedTotalStrokes;
    final relativeToPar = round.relativeToParFormatted;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        // Level 1 matte glass for summary card
        color: const Color(0xFF141A24).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(
            label: tr.strokes,
            value: holesPlayed > 0 ? '$totalStrokes' : '-',
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          _SummaryItem(
            label: tr.vs_par,
            value: relativeToPar,
            valueColor: _getScoreColor(context, round.computedRelativeToPar),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          _SummaryItem(
            label: tr.holes,
            value: '$holesPlayed/18',
          ),
        ],
      ),
    );
  }

  Color _getScoreColor(BuildContext context, int relativeToPar) {
    final colors = context.colors;
    if (relativeToPar < 0) {
      return colors.success;
    } else if (relativeToPar > 0) {
      return colors.error;
    }
    return colors.onBackground;
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryItem({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor ?? colors.onBackground,
          ),
        ),
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
