import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class VcBulletPoint extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final double iconSize;

  const VcBulletPoint({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor ?? context.colors.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
