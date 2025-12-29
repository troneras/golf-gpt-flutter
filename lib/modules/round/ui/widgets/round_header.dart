import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:flutter/material.dart';

/// Header widget displaying course name, tee, and running score
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.1),
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
                                  ? Border.all(color: Colors.grey.shade400, width: 1)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            round.tee!.name,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colors.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (onGpsTap != null)
                IconButton(
                  onPressed: onGpsTap,
                  icon: Icon(
                    round.gpsEnabled ? Icons.gps_fixed : Icons.gps_off,
                    color: round.gpsEnabled
                        ? context.colors.primary
                        : context.colors.onSurface.withValues(alpha: 0.4),
                  ),
                  tooltip: round.gpsEnabled ? 'GPS activado' : 'GPS desactivado',
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
    final holesPlayed = round.holesPlayed;
    final totalStrokes = round.computedTotalStrokes;
    final relativeToPar = round.relativeToParFormatted;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getScoreBackgroundColor(context, round.computedRelativeToPar),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(
            label: 'Golpes',
            value: holesPlayed > 0 ? '$totalStrokes' : '-',
          ),
          Container(
            width: 1,
            height: 30,
            color: context.colors.onSurface.withValues(alpha: 0.2),
          ),
          _SummaryItem(
            label: 'vs Par',
            value: relativeToPar,
            valueColor: _getScoreColor(context, round.computedRelativeToPar),
          ),
          Container(
            width: 1,
            height: 30,
            color: context.colors.onSurface.withValues(alpha: 0.2),
          ),
          _SummaryItem(
            label: 'Hoyos',
            value: '$holesPlayed/18',
          ),
        ],
      ),
    );
  }

  Color _getScoreBackgroundColor(BuildContext context, int relativeToPar) {
    if (relativeToPar < 0) {
      return Colors.green.withValues(alpha: 0.1);
    } else if (relativeToPar > 0) {
      return Colors.red.withValues(alpha: 0.1);
    }
    return context.colors.surface;
  }

  Color _getScoreColor(BuildContext context, int relativeToPar) {
    if (relativeToPar < 0) {
      return Colors.green.shade700;
    } else if (relativeToPar > 0) {
      return Colors.red.shade700;
    }
    return context.colors.onSurface;
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
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor ?? context.colors.onSurface,
          ),
        ),
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
