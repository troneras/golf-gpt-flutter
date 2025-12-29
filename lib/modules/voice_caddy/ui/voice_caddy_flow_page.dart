import 'package:apparence_kit/modules/voice_caddy/ui/animations/vc_page_transition.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/components/vc_connect_step.dart';
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
        initialRoute: 'prerequisites',
        onGenerateRoute: (settings) => switch (settings.name) {
        'prerequisites' => VoiceCaddyRouteTransition(
            builder: (context) => VcPrerequisitesStep(
              nextRoute: 'connect',
              allowSkip: allowSkip,
              onSkip: () => _handleSkip(context),
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
