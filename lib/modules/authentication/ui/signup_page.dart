import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/buttons.dart';
import 'package:apparence_kit/core/widgets/responsive_layout.dart';
import 'package:apparence_kit/core/widgets/toast.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email.dart';
import 'package:apparence_kit/modules/authentication/providers/models/password.dart';
import 'package:apparence_kit/modules/authentication/providers/models/signup_state.dart';
import 'package:apparence_kit/modules/authentication/providers/signup_state_provider.dart';
import 'package:apparence_kit/modules/authentication/repositories/authentication_repository.dart';
import 'package:apparence_kit/modules/authentication/ui/components/apple_signin.dart';
import 'package:apparence_kit/modules/authentication/ui/components/google_signin.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/social_separator.dart';
import 'package:apparence_kit/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

final _formKey = GlobalKey<FormState>();

class SignupPage extends ConsumerWidget {
  final bool canDismiss;

  const SignupPage({super.key, this.canDismiss = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        child: PopScope(
          canPop: canDismiss,
          child: Scaffold(
            backgroundColor: context.colors.background,
            resizeToAvoidBottomInset: true,
            body: ResponsiveLayout(
              small: const SignupForm(),
              medium: Center(
                child: Container(
                  width: 400,
                  color: context.colors.surface,
                  padding: const EdgeInsets.all(24.0),
                  child: const SignupForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupStateProvider);
    final tr = Translations.of(context).auth.signup;

    return AutofillGroup(
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'TalkCaddy',
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                tr.title,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr.subtitle,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onBackground.withValues(alpha: .7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                key: const Key('email_input'),
                onChanged: (value) =>
                    ref.read(signupStateProvider.notifier).setEmail(value),
                decoration: InputDecoration(
                  hintText: tr.email_hint,
                  labelText: tr.email_label,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.username, AutofillHints.email],
                validator: (value) {
                  try {
                    state.email.validate();
                  } on EmailException catch (e) {
                    return e.message;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('password_input'),
                onChanged: (newValue) =>
                    ref.read(signupStateProvider.notifier).setPassword(newValue),
                decoration: InputDecoration(
                  hintText: tr.password_hint,
                  labelText: tr.password_label,
                ),
                textInputAction: TextInputAction.done,
                obscureText: true,
                autofillHints: const [AutofillHints.newPassword],
                validator: (value) {
                  try {
                    state.password.validate();
                  } on PasswordException catch (e) {
                    return e.message;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                key: const Key('send_button'),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  ref.read(signupStateProvider.notifier).signup().then(
                    (_) async {
                      final credentials =
                          await ref.read(authRepositoryProvider).get();
                      if (credentials != null && !credentials.emailVerified) {
                        // ignore: use_build_context_synchronously
                        context.go('/email_verification');
                      } else {
                        await ref.read(userStateNotifierProvider.notifier).onOnboarded();
                        // ignore: use_build_context_synchronously
                        context.go('/');
                      }
                    },
                    onError: (err) => showErrorToast(
                      context: navigatorKey.currentContext!,
                      title: tr.error_title,
                      text: tr.error_message,
                    ),
                  );
                },
                child: switch (state) {
                  SignupStateData() => Text(tr.action),
                  SignupStateSending() => const ButtonLoading(),
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  context.pushReplacement('/signin');
                },
                child: Text(tr.has_account),
              ),
              const SizedBox(height: 24),
              const SocialSeparator(),
              const SizedBox(height: 24),
              GoogleSignInComponent(
                label: Translations.of(context).auth.sign_in_with_google,
              ),
              if (Platform.isIOS) ...[
                const SizedBox(height: 16),
                const AppleSigninComponent(),
              ],
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
