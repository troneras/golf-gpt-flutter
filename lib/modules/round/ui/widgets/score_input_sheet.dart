import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/round/domain/hole_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Bottom sheet for editing hole score (strokes, putts, penalties)
class ScoreInputSheet extends StatefulWidget {
  final HoleScore score;
  final void Function({int? strokes, int? putts, int? penalties}) onSave;

  const ScoreInputSheet({
    super.key,
    required this.score,
    required this.onSave,
  });

  /// Shows the score input sheet as a modal bottom sheet
  static Future<void> show({
    required BuildContext context,
    required HoleScore score,
    required void Function({int? strokes, int? putts, int? penalties}) onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ScoreInputSheet(
        score: score,
        onSave: onSave,
      ),
    );
  }

  @override
  State<ScoreInputSheet> createState() => _ScoreInputSheetState();
}

class _ScoreInputSheetState extends State<ScoreInputSheet> {
  late int _strokes;
  late int _putts;
  late int _penalties;

  @override
  void initState() {
    super.initState();
    _strokes = widget.score.strokes ?? widget.score.par;
    _putts = widget.score.putts ?? 2;
    _penalties = widget.score.penalties ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.colors.onSurface.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              _SheetHeader(score: widget.score),
              const SizedBox(height: 24),
              // Strokes input
              _CounterRow(
                label: 'Golpes',
                value: _strokes,
                minValue: 1,
                maxValue: 15,
                onChanged: (value) => setState(() => _strokes = value),
              ),
              const SizedBox(height: 16),
              // Putts input
              _CounterRow(
                label: 'Putts',
                value: _putts,
                minValue: 0,
                maxValue: _strokes,
                onChanged: (value) => setState(() => _putts = value),
              ),
              const SizedBox(height: 16),
              // Penalties input
              _CounterRow(
                label: 'Penaltis',
                value: _penalties,
                minValue: 0,
                maxValue: 4,
                onChanged: (value) => setState(() => _penalties = value),
              ),
              const SizedBox(height: 24),
              // Score preview
              _ScorePreview(
                strokes: _strokes,
                par: widget.score.par,
              ),
              const SizedBox(height: 24),
              // Save button
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF8BC34A),
                        Color(0xFF689F38),
                      ],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _handleSave,
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          'Guardar',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }

  void _handleSave() {
    HapticFeedback.mediumImpact();
    widget.onSave(
      strokes: _strokes,
      putts: _putts,
      penalties: _penalties,
    );
    Navigator.of(context).pop();
  }
}

class _SheetHeader extends StatelessWidget {
  final HoleScore score;

  const _SheetHeader({required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hoyo ${score.holeNumber}',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Par ${score.par}${score.yards != null ? ' • ${score.yards} yds' : ''}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class _CounterRow extends StatelessWidget {
  final String label;
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;

  const _CounterRow({
    required this.label,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _CounterButton(
          icon: Icons.remove,
          enabled: value > minValue,
          onTap: () {
            if (value > minValue) {
              HapticFeedback.lightImpact();
              onChanged(value - 1);
            }
          },
        ),
        SizedBox(
          width: 48,
          child: Text(
            '$value',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _CounterButton(
          icon: Icons.add,
          enabled: value < maxValue,
          onTap: () {
            if (value < maxValue) {
              HapticFeedback.lightImpact();
              onChanged(value + 1);
            }
          },
        ),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _CounterButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: enabled
              ? context.colors.primary.withValues(alpha: 0.1)
              : context.colors.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: enabled
              ? context.colors.primary
              : context.colors.onSurface.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}

class _ScorePreview extends StatelessWidget {
  final int strokes;
  final int par;

  const _ScorePreview({
    required this.strokes,
    required this.par,
  });

  @override
  Widget build(BuildContext context) {
    final relativeToPar = strokes - par;
    final scoreName = _getScoreName(relativeToPar, par);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(relativeToPar),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            scoreName,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: _getTextColor(relativeToPar),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getTextColor(relativeToPar).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _formatRelativeToPar(relativeToPar),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _getTextColor(relativeToPar),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreName(int relativeToPar, int par) {
    if (strokes == 1) return 'Hole in One!';
    if (relativeToPar <= -3) return 'Albatros';
    if (relativeToPar == -2) return par == 5 ? 'Albatros' : 'Eagle';
    if (relativeToPar == -1) return 'Birdie';
    if (relativeToPar == 0) return 'Par';
    if (relativeToPar == 1) return 'Bogey';
    if (relativeToPar == 2) return 'Doble Bogey';
    if (relativeToPar == 3) return 'Triple Bogey';
    return '+$relativeToPar';
  }

  String _formatRelativeToPar(int relativeToPar) {
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  Color _getBackgroundColor(int relativeToPar) {
    if (relativeToPar <= -2) return Colors.amber.shade50;
    if (relativeToPar < 0) return Colors.green.shade50;
    if (relativeToPar == 0) return Colors.grey.shade100;
    return Colors.red.shade50;
  }

  Color _getTextColor(int relativeToPar) {
    if (relativeToPar <= -2) return Colors.amber.shade800;
    if (relativeToPar < 0) return Colors.green.shade700;
    if (relativeToPar == 0) return Colors.grey.shade700;
    return Colors.red.shade700;
  }
}
