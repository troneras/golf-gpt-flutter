import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen 4: Connect - Instructions and launch ChatGPT
class VcConnectStep extends ConsumerStatefulWidget {
  final String nextRoute;

  const VcConnectStep({
    super.key,
    required this.nextRoute,
  });

  @override
  ConsumerState<VcConnectStep> createState() => _VcConnectStepState();
}

class _VcConnectStepState extends ConsumerState<VcConnectStep> {
  bool _showManualInstructions = false;
  bool _isCheckingConnection = false;

  Future<void> _openChatGPT() async {
    await ref.read(analyticsApiProvider).logEvent('gpt_setup_chatgpt_opened', {
      'method': 'deeplink',
    });
    final success = await ref.read(voiceCaddyProvider.notifier).openChatGPT();
    if (success && mounted) {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    }
  }

  Future<void> _checkConnection() async {
    setState(() => _isCheckingConnection = true);
    try {
      await ref.read(voiceCaddyProvider.notifier).checkConnectionStatus();
      final state = ref.read(voiceCaddyProvider);
      if (state.isConnected && mounted) {
        // Skip waiting screen and go directly to success
        Navigator.of(context).pushReplacementNamed('/success');
      }
    } finally {
      if (mounted) {
        setState(() => _isCheckingConnection = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).voice_caddy.connect;
    return OnboardingBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VcProgress(value: 0.67),
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
              const SizedBox(height: 32),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InstructionRow(
                          number: '1',
                          text: tr.step_1,
                        ),
                        const SizedBox(height: 16),
                        _InstructionRow(
                          number: '2',
                          text: tr.step_2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 200),
                    ),
                  ],
                  child: ElevatedButton.icon(
                    onPressed: _openChatGPT,
                    icon: const Icon(Icons.open_in_new),
                    label: Text(tr.cta),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 420),
                      duration: Duration(milliseconds: 200),
                    ),
                  ],
                  child: OutlinedButton(
                    onPressed: _isCheckingConnection ? null : _checkConnection,
                    child: _isCheckingConnection
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(tr.check_connection),
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
                      setState(() {
                        _showManualInstructions = !_showManualInstructions;
                      });
                    },
                    child: Text(tr.fallback),
                  ),
                ),
              ),
              if (_showManualInstructions) ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.colors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.manual_title,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _ManualStep(number: '1', text: tr.manual_step_1),
                        const SizedBox(height: 8),
                        _ManualStep(number: '2', text: tr.manual_step_2),
                        const SizedBox(height: 8),
                        _ManualStep(number: '3', text: tr.manual_step_3),
                        const SizedBox(height: 8),
                        _ManualStep(number: '4', text: tr.manual_step_4),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstructionRow extends StatelessWidget {
  final String number;
  final String text;

  const _InstructionRow({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: context.colors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _ManualStep extends StatelessWidget {
  final String number;
  final String text;

  const _ManualStep({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.',
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.onBackground.withOpacity(0.7),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.onBackground.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
