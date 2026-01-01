// ignore_for_file: use_build_context_synchronously

import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/widgets/toast.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/signin_state_provider.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/round_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoogleSignInComponent extends ConsumerWidget {
  final String? label;

  const GoogleSignInComponent({super.key, this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context);
    Future<void> onPressed() async {
      try {
        await ref.read(signinStateProvider.notifier).signinWithGoogle();
        await ref.read(userStateNotifierProvider.notifier).onOnboarded();
        context.go('/');
      } catch (err) {
        showErrorToast(
          context: context,
          title: tr.common.error,
          text: tr.auth.social_signin_error.google,
        );
      }
    }
    if (label != null) {
      return SocialSigninButton.googleWithText(onPressed, label: label!);
    }
    return SocialSigninButton.google(onPressed);
  }
}

class GooglePlayGamesSignInComponent extends ConsumerWidget {
  const GooglePlayGamesSignInComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context);
    return SocialSigninButton.googlePlayGames(
      () async {
        try {
          await ref.read(signinStateProvider.notifier).signinWithGoogle();
          context.pushReplacementNamed('/signup');
        } catch (err) {
          showErrorToast(
            context: context,
            title: tr.common.error,
            text: tr.auth.social_signin_error.google_play,
          );
        }
      },
    );
  }
}
