import 'package:apparence_kit/modules/onboarding/ui/animations/page_transitions.dart';
import 'package:apparence_kit/modules/onboarding/ui/components/onboarding_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      initialRoute: 'welcome',
      onGenerateRoute: (settings) => switch (settings.name) {
        'welcome' => OnboardingRouteTransition(
            builder: (context) => const OnboardingWelcomeStep(
              nextRoute: 'app_purpose',
            ),
            settings: settings,
          ),
        'app_purpose' => OnboardingRouteTransition(
            builder: (context) => const OnboardingAppPurposeStep(
              nextRoute: 'location_permission',
            ),
            settings: settings,
          ),
        'location_permission' => OnboardingRouteTransition(
            builder: (context) => OnboardingLocationPermissionStep(
              nextRoute: 'login',
            ),
            settings: settings,
          ),
        'login' => OnboardingRouteTransition(
            builder: (context) {
              // Navigate to login using GoRouter
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/signin');
              });
              return const SizedBox.shrink();
            },
            settings: settings,
          ),
        String() || null => throw 'Unimplemented route: ${settings.name}',
      },
    );
  }
}
