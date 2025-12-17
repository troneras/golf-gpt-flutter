import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/buttons.dart';
import 'package:apparence_kit/core/widgets/toast.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email.dart';
import 'package:apparence_kit/modules/authentication/providers/models/password.dart';
import 'package:apparence_kit/modules/authentication/providers/models/signin_state.dart';
import 'package:apparence_kit/modules/authentication/providers/signin_state_provider.dart';
import 'package:apparence_kit/modules/authentication/repositories/authentication_repository.dart';
import 'package:apparence_kit/modules/authentication/ui/components/apple_signin.dart';
import 'package:apparence_kit/modules/authentication/ui/components/google_signin.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/social_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

final _formKey = GlobalKey<FormState>();

class SigninPage extends ConsumerWidget {
  final bool canDismiss;

  const SigninPage({super.key, this.canDismiss = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signinStateProvider);
    final tr = Translations.of(context).auth.signin;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: canDismiss,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: AutofillGroup(
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        tr.title,
                        style: context.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
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
                        onChanged: (value) => ref
                            .read(signinStateProvider.notifier)
                            .setEmail(value),
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
                        onChanged: (newValue) => ref
                            .read(signinStateProvider.notifier)
                            .setPassword(newValue),
                        decoration: InputDecoration(
                          hintText: tr.password_hint,
                          labelText: tr.password_label,
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        autofillHints: const [AutofillHints.password],
                        validator: (value) {
                          try {
                            state.password.validate();
                          } on PasswordException catch (e) {
                            return e.message;
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => context.push('/recover_password'),
                          child: Text(tr.forgot_password),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        key: const Key('send_button'),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          FocusScope.of(context).unfocus();
                          ref
                              .read(signinStateProvider.notifier)
                              .signin()
                              .then(
                                (value) async {
                                  final credentials =
                                      await ref.read(authRepositoryProvider).get();
                                  if (credentials != null &&
                                      !credentials.emailVerified) {
                                    // ignore: use_build_context_synchronously
                                    context.go('/email_verification');
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    context.go('/complete');
                                  }
                                },
                                onError: (err) => showErrorToast(
                                  context: context,
                                  title: tr.error_title,
                                  text: tr.error_message,
                                ),
                              );
                        },
                        child: switch (state) {
                          SigninStateData() => Text(tr.action),
                          SigninStateSending() => const ButtonLoading(),
                        },
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => context.pushReplacement('/signup'),
                        child: Text(tr.no_account),
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
            ),
          ),
        ),
      ),
    );
  }
}
