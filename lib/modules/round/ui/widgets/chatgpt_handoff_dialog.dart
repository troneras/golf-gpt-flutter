import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';

class ChatgptHandoffDialog extends StatelessWidget {
  const ChatgptHandoffDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).voice_caddy.handoff;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/launcher/foreground.png',
              width: 64,
              height: 64,
            ),
            const SizedBox(height: 16),
            Text(
              tr.title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Divider(
              color: context.colors.onSurface.withValues(alpha: 0.1),
              height: 1,
            ),
            const SizedBox(height: 16),
            Text(
              tr.body,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              tr.example,
              style: context.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: context.colors.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Divider(
              color: context.colors.onSurface.withValues(alpha: 0.1),
              height: 1,
            ),
            const SizedBox(height: 16),
            Text(
              tr.footer,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(tr.action),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the ChatGPT handoff dialog.
/// Returns true if the user tapped OK, false otherwise.
Future<bool> showChatgptHandoffDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const ChatgptHandoffDialog(),
  );
  return result ?? false;
}
