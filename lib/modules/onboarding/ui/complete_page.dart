import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CompletePage extends ConsumerStatefulWidget {
  const CompletePage({super.key});

  @override
  ConsumerState<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends ConsumerState<CompletePage> {
  @override
  void initState() {
    super.initState();
    _markOnboarded();
  }

  Future<void> _markOnboarded() async {
    final userState = ref.read(userStateNotifierProvider);
    if (!userState.user.isOnboarded) {
      await ref.read(userStateNotifierProvider.notifier).onOnboarded();
    }
  }

  void _continueToHome() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).onboarding.complete;

    return PopScope(
      canPop: false,
      child: OnboardingBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 200),
                      duration: Duration(milliseconds: 400),
                    ),
                    ScaleEffect(
                      delay: Duration(milliseconds: 200),
                      duration: Duration(milliseconds: 400),
                      begin: Offset(0.8, 0.8),
                      end: Offset(1, 1),
                    ),
                  ],
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: context.colors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 300),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 400),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: Text(
                    tr.title,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 300),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 400),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: Text(
                    tr.subtitle,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.onBackground.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 300),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 400),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      tr.command,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.primary,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 800),
                      duration: Duration(milliseconds: 300),
                    ),
                  ],
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _continueToHome,
                      child: Text(tr.action),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
