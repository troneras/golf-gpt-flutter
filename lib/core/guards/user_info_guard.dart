import 'package:apparence_kit/core/guards/guard.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  bool _isRedirecting = false;

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
    if (!user.isGptConnected) {
      if (!_isRedirecting) {
        _isRedirecting = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            context.pushReplacement(
              '/voice-caddy-setup',
              extra: {'allowSkip': false},
            );
          }
        });
      }
      return const Material(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return widget.child;
  }
}
