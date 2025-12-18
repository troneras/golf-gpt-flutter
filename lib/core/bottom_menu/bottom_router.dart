import 'package:animations/animations.dart';
import 'package:apparence_kit/modules/home/home_page.dart';
import 'package:apparence_kit/modules/rounds/ui/rounds_page.dart';
import 'package:apparence_kit/modules/settings/settings_page.dart';
import 'package:bart/bart.dart';
import 'package:flutter/material.dart';

List<BartMenuRoute> subRoutes() {
  return [
    BartMenuRoute.bottomBar(
      label: "Inicio",
      icon: Icons.home,
      path: 'home',
      pageBuilder: (_, _, settings) => const HomePage(),
      transitionDuration: bottomBarTransitionDuration,
      transitionsBuilder: bottomBarTransition,
    ),
    BartMenuRoute.bottomBar(
      label: "Rondas",
      icon: Icons.flag,
      path: 'rounds',
      pageBuilder: (_, _, settings) => const RoundsPage(),
      transitionDuration: bottomBarTransitionDuration,
      transitionsBuilder: bottomBarTransition,
    ),
    BartMenuRoute.bottomBar(
      label: "Ajustes",
      icon: Icons.settings,
      path: 'settings',
      pageBuilder: (_, _, settings) => const SettingsPage(),
      transitionDuration: bottomBarTransitionDuration,
      transitionsBuilder: bottomBarTransition,
    ),
  ];
}

Widget bottomBarTransition(
  BuildContext c,
  Animation<double> a1,
  Animation<double> a2,
  Widget child,
) =>
    FadeThroughTransition(
      animation: a1,
      secondaryAnimation: a2,
      fillColor: Colors.transparent,
      child: child,
    );

const bottomBarTransitionDuration = Duration(milliseconds: 300);
