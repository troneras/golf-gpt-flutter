import 'package:apparence_kit/core/guards/guard.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfosGuard extends ConsumerStatefulWidget {
  final Widget child;
  final String fallbackRoute;

  const UserInfosGuard({
    super.key,
    required this.child,
    required this.fallbackRoute,
  });

  @override
  ConsumerState<UserInfosGuard> createState() => _UserInfosGuardState();
}

class _UserInfosGuardState extends ConsumerState<UserInfosGuard> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(userStateNotifierProvider);
    if (authState.user.isLoading) {
      return const Material(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    final user = authState.user;
    if (!user.isOnboarded) {
      return Guard(
        canActivate: Future.value(false),
        fallbackRoute: widget.fallbackRoute,
        child: widget.child,
      );
    }
    // Voice caddy setup is now optional - users can set it up from home page
    return widget.child;
  }
}
