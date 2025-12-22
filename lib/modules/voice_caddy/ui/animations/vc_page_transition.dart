import 'package:animations/animations.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/cupertino.dart';

class VoiceCaddyRouteTransition extends CupertinoPageRoute {
  VoiceCaddyRouteTransition({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      fillColor: context.colors.background,
      child: builder(context),
    );
  }
}
