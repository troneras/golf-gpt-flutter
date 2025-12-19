import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/bag/domain/club.dart';
import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final Club club;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ClubCard({
    super.key,
    required this.club,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  club.displayName,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                club.distanceFormatted,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: club.distanceYards != null
                      ? context.colors.primary
                      : context.colors.onSurface.withValues(alpha: 0.4),
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (onDelete != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: context.colors.onSurface.withValues(alpha: 0.4),
                    size: 20,
                  ),
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
