import 'package:apparence_kit/core/theme/colors.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
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
    final colors = context.colors;
    final tr = Translations.of(context).score_input;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF141A24).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          left: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          right: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
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
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              _SheetHeader(score: widget.score),
              const SizedBox(height: 24),
              // Strokes input
              _CounterRow(
                label: tr.strokes,
                value: _strokes,
                minValue: 1,
                maxValue: 15,
                onChanged: (value) => setState(() => _strokes = value),
              ),
              const SizedBox(height: 16),
              // Putts input
              _CounterRow(
                label: tr.putts,
                value: _putts,
                minValue: 0,
                maxValue: _strokes,
                onChanged: (value) => setState(() => _putts = value),
              ),
              const SizedBox(height: 16),
              // Penalties input
              _CounterRow(
                label: tr.penalties,
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
                      onTap: _handleSave,
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          tr.save,
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
    final colors = context.colors;
    final tr = Translations.of(context).score_input;
    final holeTitle = tr.hole_title.replaceAll('{holeNumber}', score.holeNumber.toString());
    final parInfo = score.yards != null
        ? tr.par_yards_info
            .replaceAll('{par}', score.par.toString())
            .replaceAll('{yards}', score.yards.toString())
        : tr.par_info.replaceAll('{par}', score.par.toString());
    return Column(
      children: [
        Text(
          holeTitle,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          parInfo,
          style: context.textTheme.bodyMedium?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.5),
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
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: colors.onSurface.withValues(alpha: 0.7),
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
              fontWeight: FontWeight.w600,
              color: colors.onSurface,
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
    final colors = context.colors;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: enabled
              ? colors.primary.withValues(alpha: 0.15)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: enabled
                ? colors.primary.withValues(alpha: 0.3)
                : Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Icon(
          icon,
          color: enabled
              ? colors.primary
              : Colors.white.withValues(alpha: 0.3),
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
    final colors = context.colors;
    final relativeToPar = strokes - par;
    final scoreName = _getScoreName(context, relativeToPar, par);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF141A24).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            scoreName,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: _getTextColor(relativeToPar, colors),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getTextColor(relativeToPar, colors).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _formatRelativeToPar(relativeToPar),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: _getTextColor(relativeToPar, colors),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreName(BuildContext context, int relativeToPar, int par) {
    final tr = Translations.of(context).score_names;
    if (strokes == 1) return tr.hole_in_one;
    if (relativeToPar <= -3) return tr.albatross;
    if (relativeToPar == -2) return par == 5 ? tr.albatross : tr.eagle;
    if (relativeToPar == -1) return tr.birdie;
    if (relativeToPar == 0) return tr.par;
    if (relativeToPar == 1) return tr.bogey;
    if (relativeToPar == 2) return tr.double_bogey;
    if (relativeToPar == 3) return tr.triple_bogey;
    return '+$relativeToPar';
  }

  String _formatRelativeToPar(int relativeToPar) {
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  Color _getTextColor(int relativeToPar, ApparenceKitColors colors) {
    // Use muted semantic colors from design system
    if (relativeToPar <= -2) return const Color(0xFFB8956A); // Muted amber (exceptional)
    if (relativeToPar < 0) return colors.success; // Muted green
    if (relativeToPar == 0) return colors.onSurface.withValues(alpha: 0.7); // Neutral
    return colors.error; // Muted red
  }
}
