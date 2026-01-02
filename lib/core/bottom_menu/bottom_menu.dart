import 'dart:ui';

import 'package:apparence_kit/core/bottom_menu/bottom_router.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/responsive_layout.dart';
import 'package:bart/bart.dart' as bart;
import 'package:bart/bart/widgets/bottom_bar/styles/bottom_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This bottom menu is powered by Bart packages
/// https://pub.dev/packages/bart
/// It allows you to create a bottom menu with a router and handle
/// all tabs navigation separately.
/// See the bottom_router.dart file to add tabs or subpages to show on tabs
class BottomMenu extends StatelessWidget {
  final String? initialRoute;

  const BottomMenu({
    super.key,
    this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ResponsiveLayout(
        small: bart.BartScaffold(
          routesBuilder: subRoutes,
          bottomBar: bart.BartBottomBar.custom(
            bottomBarFactory: const _GlassyBottomBarFactory(),
          ),
          initialRoute: initialRoute,
          scaffoldOptions: bart.ScaffoldOptions(
            backgroundColor: colors.background,
            extendBody: true,
          ),
          onRouteChanged: (route) {
            // If you want to log tab events to analytics
            // MixpanelAnalyticsApi.instance().logEvent('home/$route', {});
          },
        ),
        medium: bart.BartScaffold(
          routesBuilder: subRoutes,
          bottomBar: bart.BartBottomBar.adaptive(),
          initialRoute: initialRoute,
          scaffoldOptions: bart.ScaffoldOptions(
            backgroundColor: colors.background,
          ),
          sideBarOptions: bart.RailSideBarOptions(
            extended: true,
          ),
        ),
      ),
    );
  }
}

/// Factory for creating glassy bottom navigation bar
class _GlassyBottomBarFactory extends BartBottomBarFactory {
  const _GlassyBottomBarFactory();

  @override
  Widget create({
    required BuildContext context,
    required List<bart.BartMenuRoute> routes,
    required void Function(int) onTap,
    required int currentIndex,
  }) {
    return _GlassyBottomBar(
      routes: routes,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

/// Glassy transparent bottom navigation bar - HUD style with blur
class _GlassyBottomBar extends StatelessWidget {
  final List<bart.BartMenuRoute> routes;
  final int currentIndex;
  final void Function(int) onTap;

  const _GlassyBottomBar({
    required this.routes,
    required this.currentIndex,
    required this.onTap,
  });

  void _handleTap(int index) {
    // Guard against tapping when bart's navigator isn't ready.
    // This can happen when navigating back from a GoRouter route outside
    // the bart navigation (e.g., round-in-progress) and tapping immediately.
    try {
      onTap(index);
    } catch (e) {
      // Navigator not ready yet - ignore tap
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Frosted glass effect - blur with semi-transparent overlay
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          decoration: BoxDecoration(
            color: colors.background.withValues(alpha: 0.35),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: routes.asMap().entries.map((entry) {
                  final index = entry.key;
                  final route = entry.value;
                  final isSelected = currentIndex == index;
                  return Expanded(
                    child: _GlassyNavItem(
                      icon: route.icon ?? Icons.circle,
                      label: route.label ?? '',
                      isSelected: isSelected,
                      onTap: () => _handleTap(index),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassyNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GlassyNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Inactive items almost invisible - focus mode
    final inactiveColor = Colors.white.withValues(alpha: 0.25);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? colors.primary : inactiveColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: isSelected ? colors.primary : inactiveColor,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
