import 'dart:io';

import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// Screen 1: Prerequisites - ChatGPT app check
class VcPrerequisitesStep extends ConsumerStatefulWidget {
  final String nextRoute;
  final bool allowSkip;
  final VoidCallback? onSkip;

  const VcPrerequisitesStep({
    super.key,
    required this.nextRoute,
    this.allowSkip = true,
    this.onSkip,
  });

  @override
  ConsumerState<VcPrerequisitesStep> createState() =>
      _VcPrerequisitesStepState();
}

class _VcPrerequisitesStepState extends ConsumerState<VcPrerequisitesStep> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('gpt_setup_prerequisites_viewed', {});
    });
  }

  Future<void> _openAppStore() async {
    final url = Platform.isIOS
        ? 'https://apps.apple.com/app/chatgpt/id6448311069'
        : 'https://play.google.com/store/apps/details?id=com.openai.chatgpt';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).voice_caddy.prerequisites;
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Expanded(child: VcProgress(value: 0.25)),
                if (widget.allowSkip && widget.onSkip != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton(
                      onPressed: widget.onSkip,
                      child: Text(
                        tr.skip,
                        style: TextStyle(
                          color: context.colors.onBackground.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 50),
                    end: Offset.zero,
                  ),
                ],
                child: Text(
                  tr.title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Text(
                  tr.subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onBackground.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 30),
                    end: Offset.zero,
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: context.colors.onBackground.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    children: [
                      // ChatGPT icon placeholder
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10A37F),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tr.chatgpt_label,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: _openAppStore,
                        icon: Icon(
                          Platform.isIOS ? Icons.apple : Icons.shop,
                          size: 20,
                        ),
                        label: Text(tr.get_app),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: context.colors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tr.hint,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onBackground.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
                  },
                  child: Text(tr.cta),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
