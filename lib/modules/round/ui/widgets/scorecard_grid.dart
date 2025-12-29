import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/ui/widgets/hole_score_cell.dart';
import 'package:flutter/material.dart';

/// Full 18-hole scorecard grid with front 9/back 9 subtotals
class ScorecardGrid extends StatelessWidget {
  final Round round;
  final int currentHole;
  final void Function(int hole) onHoleTap;
  final void Function(int hole)? onIncrement;
  final void Function(int hole)? onDecrement;
  final ScrollController? scrollController;

  const ScorecardGrid({
    super.key,
    required this.round,
    required this.currentHole,
    required this.onHoleTap,
    this.onIncrement,
    this.onDecrement,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        // Header
        const ScorecardHeader(),

        // Front 9 (holes 1-9)
        ...round.frontNine.map((score) => HoleScoreCell(
          score: score,
          isCurrentHole: score.holeNumber == currentHole,
          showQuickButtons: score.holeNumber == currentHole,
          onTap: () => onHoleTap(score.holeNumber),
          onIncrement: onIncrement != null
              ? () => onIncrement!(score.holeNumber)
              : null,
          onDecrement: onDecrement != null
              ? () => onDecrement!(score.holeNumber)
              : null,
        )),

        // Front 9 subtotal (OUT)
        SubtotalRow(
          label: 'OUT',
          yards: round.outYards,
          par: round.outPar,
          strokes: round.outStrokes,
          relativeToPar: round.outRelativeToPar,
        ),

        // Back 9 (holes 10-18)
        ...round.backNine.map((score) => HoleScoreCell(
          score: score,
          isCurrentHole: score.holeNumber == currentHole,
          showQuickButtons: score.holeNumber == currentHole,
          onTap: () => onHoleTap(score.holeNumber),
          onIncrement: onIncrement != null
              ? () => onIncrement!(score.holeNumber)
              : null,
          onDecrement: onDecrement != null
              ? () => onDecrement!(score.holeNumber)
              : null,
        )),

        // Back 9 subtotal (IN)
        SubtotalRow(
          label: 'IN',
          yards: round.inYards,
          par: round.inPar,
          strokes: round.inStrokes,
          relativeToPar: round.inRelativeToPar,
        ),

        // Total
        _TotalRow(round: round),

        // Bottom padding for safe area
        const SizedBox(height: 100),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  final Round round;

  const _TotalRow({required this.round});

  @override
  Widget build(BuildContext context) {
    final holesPlayed = round.holesPlayed;
    final totalStrokes = round.computedTotalStrokes;
    final relativeToPar = round.computedRelativeToPar;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.primary.withValues(alpha: 0.1),
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
              'TOT',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              round.totalYards != null ? '${round.totalYards}' : '-',
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
              '${round.totalPar}',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              holesPlayed > 0 ? '$totalStrokes' : '-',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              _formatRelativeToPar(holesPlayed > 0 ? relativeToPar : null),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: _getRelativeColor(context, holesPlayed > 0 ? relativeToPar : null),
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
