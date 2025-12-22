import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen 5: Waiting - Polling for OAuth completion
class VcWaitingStep extends ConsumerStatefulWidget {
  final String nextRoute;

  const VcWaitingStep({
    super.key,
    required this.nextRoute,
  });

  @override
  ConsumerState<VcWaitingStep> createState() => _VcWaitingStepState();
}

class _VcWaitingStepState extends ConsumerState<VcWaitingStep> {
  @override
  void initState() {
    super.initState();
    // Start polling when this screen is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(voiceCaddyProvider.notifier).startPolling();
    });
  }

  @override
  void dispose() {
    // Stop polling when leaving this screen
    ref.read(voiceCaddyProvider.notifier).stopPolling();
    super.dispose();
  }

  Future<void> _handleManualConfirm() async {
    await ref.read(voiceCaddyProvider.notifier).confirmConnection();
    final state = ref.read(voiceCaddyProvider);
    if (state.isConnected && mounted) {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).voice_caddy.waiting;
    final state = ref.watch(voiceCaddyProvider);

    // Auto-navigate when connected
    if (state.isConnected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      });
    }

    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VcProgress(value: 0.83),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Column(
                  children: [
                    // Pulsing animation for waiting indicator
                    Animate(
                      onPlay: (controller) => controller.repeat(),
                      effects: const [
                        ScaleEffect(
                          begin: Offset(1, 1),
                          end: Offset(1.1, 1.1),
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                        ),
                        FadeEffect(
                          begin: 0.6,
                          end: 1.0,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                        ),
                      ],
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: context.colors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: context.colors.primary.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.sync,
                                size: 32,
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      tr.title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      tr.subtitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colors.onBackground.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: ElevatedButton(
                  onPressed: state.isChecking ? null : _handleManualConfirm,
                  child: state.isChecking
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(tr.cta),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 450),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: TextButton(
                  onPressed: () {
                    // TODO: Show help dialog or FAQ
                  },
                  child: Text(tr.help),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
