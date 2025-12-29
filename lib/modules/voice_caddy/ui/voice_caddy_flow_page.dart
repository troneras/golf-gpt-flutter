import 'package:apparence_kit/modules/voice_caddy/ui/animations/vc_page_transition.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_connect_step.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_how_it_works_step.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_intro_step.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_prerequisites_step.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_success_step.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_waiting_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VoiceCaddyFlowPage extends ConsumerWidget {
  /// Whether to allow skipping the flow
  final bool allowSkip;

  const VoiceCaddyFlowPage({
    super.key,
    this.allowSkip = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: allowSkip,
      child: Navigator(
        initialRoute: 'intro',
        onGenerateRoute: (settings) => switch (settings.name) {
        'intro' => VoiceCaddyRouteTransition(
            builder: (context) => VcIntroStep(
              nextRoute: 'prerequisites',
              allowSkip: allowSkip,
              onSkip: () => _handleSkip(context),
            ),
            settings: settings,
          ),
        'prerequisites' => VoiceCaddyRouteTransition(
            builder: (context) => const VcPrerequisitesStep(
              nextRoute: 'how_it_works',
            ),
            settings: settings,
          ),
        'how_it_works' => VoiceCaddyRouteTransition(
            builder: (context) => const VcHowItWorksStep(
              nextRoute: 'connect',
            ),
            settings: settings,
          ),
        'connect' => VoiceCaddyRouteTransition(
            builder: (context) => const VcConnectStep(
              nextRoute: 'waiting',
            ),
            settings: settings,
          ),
        'waiting' => VoiceCaddyRouteTransition(
            builder: (context) => const VcWaitingStep(
              nextRoute: 'success',
            ),
            settings: settings,
          ),
        'success' => VoiceCaddyRouteTransition(
            builder: (context) => VcSuccessStep(
              onStartRound: () => _handleStartRound(context),
              onGoHome: () => _handleGoHome(context),
            ),
            settings: settings,
          ),
        'exit' => VoiceCaddyRouteTransition(
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/');
              });
              return const SizedBox.shrink();
            },
            settings: settings,
          ),
        String() || null => throw 'Unimplemented route: ${settings.name}',
        },
      ),
    );
  }

  void _handleSkip(BuildContext context) {
    context.go('/');
  }

  void _handleStartRound(BuildContext context) {
    context.go('/select-course');
  }

  void _handleGoHome(BuildContext context) {
    context.go('/');
  }
}
