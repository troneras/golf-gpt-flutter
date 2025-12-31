import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// A styled dialog that follows the design system.
/// Uses matte glassmorphism with proper dark theme colors.
class StyledDialog extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String? content;
  final Widget? contentWidget;
  final List<StyledDialogAction> actions;

  const StyledDialog({
    super.key,
    this.icon,
    required this.title,
    this.content,
    this.contentWidget,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
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
              if (icon != null) ...[
                icon!,
                const SizedBox(height: 16),
              ],
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              if (content != null) ...[
                const SizedBox(height: 12),
                Text(
                  content!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              if (contentWidget != null) ...[
                const SizedBox(height: 16),
                contentWidget!,
              ],
              const SizedBox(height: 24),
              if (actions.length == 1)
                SizedBox(
                  width: double.infinity,
                  child: _buildActionButton(context, actions.first),
                )
              else
                Row(
                  children: [
                    for (int i = 0; i < actions.length; i++) ...[
                      if (i > 0) const SizedBox(width: 12),
                      Expanded(child: _buildActionButton(context, actions[i])),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, StyledDialogAction action) {
    final colors = context.colors;

    if (action.isPrimary) {
      return Container(
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
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                action.label,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    } else if (action.isDestructive) {
      final destructiveColor = action.destructiveColor ?? colors.error;
      return Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: destructiveColor.withValues(alpha: 0.15),
          border: Border.all(
            color: destructiveColor.withValues(alpha: 0.3),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                action.label,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: destructiveColor,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // Ghost button (secondary)
      return Container(
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
            onTap: action.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Text(
                action.label,
                style: context.textTheme.titleSmall?.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

/// Action button for StyledDialog
class StyledDialogAction {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
  final bool isDestructive;
  final Color? destructiveColor;

  const StyledDialogAction({
    required this.label,
    required this.onTap,
    this.isPrimary = false,
    this.isDestructive = false,
    this.destructiveColor,
  });

  /// Creates a primary action button with gradient and glow
  const StyledDialogAction.primary({
    required this.label,
    required this.onTap,
  })  : isPrimary = true,
        isDestructive = false,
        destructiveColor = null;

  /// Creates a secondary/ghost action button
  const StyledDialogAction.secondary({
    required this.label,
    required this.onTap,
  })  : isPrimary = false,
        isDestructive = false,
        destructiveColor = null;

  /// Creates a destructive action button (for delete, etc.)
  const StyledDialogAction.destructive({
    required this.label,
    required this.onTap,
    this.destructiveColor,
  })  : isPrimary = false,
        isDestructive = true;
}

/// Shows a styled dialog that follows the design system.
Future<T?> showStyledDialog<T>({
  required BuildContext context,
  Widget? icon,
  required String title,
  String? content,
  Widget? contentWidget,
  required List<StyledDialogAction> actions,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => StyledDialog(
      icon: icon,
      title: title,
      content: content,
      contentWidget: contentWidget,
      actions: actions,
    ),
  );
}
