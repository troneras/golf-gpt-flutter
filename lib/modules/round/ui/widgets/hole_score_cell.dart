import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/round/domain/hole_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A single row in the scorecard displaying hole number, yards, par, and score
class HoleScoreCell extends StatelessWidget {
  final HoleScore score;
  final bool isCurrentHole;
  final bool showQuickButtons;
  final VoidCallback? onTap;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const HoleScoreCell({
    super.key,
    required this.score,
    this.isCurrentHole = false,
    this.showQuickButtons = false,
    this.onTap,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentHole
            ? const Color(0xFFFFF8E1)
            : context.colors.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap?.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              // Current hole indicator
              SizedBox(
                width: 16,
                child: isCurrentHole
                    ? Icon(
                        Icons.play_arrow,
                        size: 14,
                        color: context.colors.primary,
                      )
                    : null,
              ),
              // Hole number
              SizedBox(
                width: 32,
                child: Text(
                  '${score.holeNumber}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: isCurrentHole ? FontWeight.bold : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Yards
              SizedBox(
                width: 48,
                child: Text(
                  score.yards != null ? '${score.yards}' : '-',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Par
              SizedBox(
                width: 32,
                child: Text(
                  '${score.par}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Score
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showQuickButtons && onDecrement != null)
                      _QuickButton(
                        icon: Icons.remove,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          onDecrement?.call();
                        },
                      ),
                    const SizedBox(width: 8),
                    _ScoreBadge(score: score),
                    const SizedBox(width: 8),
                    if (showQuickButtons && onIncrement != null)
                      _QuickButton(
                        icon: Icons.add,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          onIncrement?.call();
                        },
                      ),
                  ],
                ),
              ),
              // Relative to par
              SizedBox(
                width: 40,
                child: Text(
                  score.isPlayed ? score.relativeToParFormatted : '-',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _getRelativeColor(context, score.relativeToPar),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRelativeColor(BuildContext context, int? relativeToPar) {
    if (relativeToPar == null) {
      return context.colors.onSurface.withValues(alpha: 0.4);
    }
    if (relativeToPar < 0) {
      return Colors.green.shade700;
    } else if (relativeToPar > 0) {
      return Colors.red.shade700;
    }
    return context.colors.onSurface;
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuickButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: context.colors.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: context.colors.primary,
        ),
      ),
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  final HoleScore score;

  const _ScoreBadge({required this.score});

  @override
  Widget build(BuildContext context) {
    if (!score.isPlayed) {
      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: context.colors.onSurface.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            '-',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ),
      );
    }

    final relativeToPar = score.relativeToPar ?? 0;
    final decoration = _getScoreDecoration(context, relativeToPar);

    return Container(
      width: 36,
      height: 36,
      decoration: decoration,
      child: Center(
        child: Text(
          '${score.strokes}',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: _getScoreTextColor(context, relativeToPar),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getScoreDecoration(BuildContext context, int relativeToPar) {
    // Eagle or better (-2 or less): double circle
    if (relativeToPar <= -2) {
      return BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber.shade100,
        border: Border.all(color: Colors.amber.shade700, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.shade200,
            spreadRadius: 2,
            blurRadius: 0,
          ),
        ],
      );
    }
    // Birdie (-1): circle
    if (relativeToPar == -1) {
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green.shade700, width: 2),
      );
    }
    // Par (0): no decoration
    if (relativeToPar == 0) {
      return const BoxDecoration();
    }
    // Bogey (+1): square
    if (relativeToPar == 1) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.red.shade400, width: 2),
      );
    }
    // Double bogey or worse (+2 or more): filled square
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.red.shade100,
      border: Border.all(color: Colors.red.shade700, width: 2),
    );
  }

  Color _getScoreTextColor(BuildContext context, int relativeToPar) {
    if (relativeToPar <= -2) {
      return Colors.amber.shade900;
    }
    if (relativeToPar < 0) {
      return Colors.green.shade700;
    }
    if (relativeToPar > 0) {
      return Colors.red.shade700;
    }
    return context.colors.onSurface;
  }
}

/// Header row for the scorecard grid
class ScorecardHeader extends StatelessWidget {
  const ScorecardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.background,
        border: Border(
          bottom: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16), // For current hole indicator
          _HeaderCell(text: 'Hoyo', width: 32),
          _HeaderCell(text: 'Yds', width: 48),
          _HeaderCell(text: 'Par', width: 32),
          Expanded(
            child: Text(
              'Score',
              style: context.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _HeaderCell(text: '+/-', width: 40),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final double width;

  const _HeaderCell({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colors.onSurface.withValues(alpha: 0.6),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Subtotal row for front 9 (OUT) or back 9 (IN)
class SubtotalRow extends StatelessWidget {
  final String label;
  final int? yards;
  final int par;
  final int? strokes;
  final int? relativeToPar;

  const SubtotalRow({
    super.key,
    required this.label,
    this.yards,
    required this.par,
    this.strokes,
    this.relativeToPar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.onSurface.withValues(alpha: 0.05),
        border: Border(
          bottom: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SizedBox(
            width: 32,
            child: Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              yards != null ? '$yards' : '-',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              '$par',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              strokes != null ? '$strokes' : '-',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              _formatRelativeToPar(relativeToPar),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _getRelativeColor(context, relativeToPar),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String _formatRelativeToPar(int? relativeToPar) {
    if (relativeToPar == null) return '-';
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  Color _getRelativeColor(BuildContext context, int? relativeToPar) {
    if (relativeToPar == null) {
      return context.colors.onSurface.withValues(alpha: 0.4);
    }
    if (relativeToPar < 0) {
      return Colors.green.shade700;
    } else if (relativeToPar > 0) {
      return Colors.red.shade700;
    }
    return context.colors.onSurface;
  }
}
