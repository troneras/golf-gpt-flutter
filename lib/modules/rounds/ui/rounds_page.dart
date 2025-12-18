import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundsPage extends ConsumerWidget {
  const RoundsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context).rounds;
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(tr.title),
        backgroundColor: context.colors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.golf_course,
                  size: 80,
                  color: context.colors.onBackground.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 24),
                Text(
                  tr.empty,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onBackground.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  tr.empty_hint,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onBackground.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
