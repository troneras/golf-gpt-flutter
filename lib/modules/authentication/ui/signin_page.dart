import 'dart:ui';

import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
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
    final colors = context.colors;
    final backgroundColor = colors.background;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: canDismiss,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              // Background image - golf course
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background-2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Vignette effect
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1.0,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.25),
                        Colors.black.withValues(alpha: 0.45),
                      ],
                      stops: const [0.0, 0.45, 0.75, 1.0],
                    ),
                  ),
                ),
              ),
              // Dark gradient overlay from bottom
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.3, 0.6, 1.0],
                      colors: [
                        backgroundColor.withValues(alpha: 0.3),
                        backgroundColor.withValues(alpha: 0.1),
                        backgroundColor.withValues(alpha: 0.6),
                        backgroundColor.withValues(alpha: 0.95),
                      ],
                    ),
                  ),
                ),
              ),
              // Main content
              SafeArea(
                child: AutofillGroup(
                  child: Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(height: 48),
                        // TalkCaddy title
                        Text(
                          'TalkCaddy',
                          style: context.textTheme.displayLarge?.copyWith(
                            color: colors.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        // Subtitle
                        Text(
                          tr.subtitle,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: colors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),
                        // Glass form card
                        _GlassFormCard(
                          child: Column(
                            children: [
                              // Email field
                              _GlassTextField(
                                key: const Key('email_input'),
                                icon: Icons.email_outlined,
                                hintText: tr.email_hint,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                onChanged: (value) => ref
                                    .read(signinStateProvider.notifier)
                                    .setEmail(value),
                                validator: (value) {
                                  try {
                                    state.email.validate();
                                  } on EmailException catch (e) {
                                    return e.message;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              // Password field
                              _GlassTextField(
                                key: const Key('password_input'),
                                icon: Icons.lock_outline,
                                hintText: tr.password_hint,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                autofillHints: const [AutofillHints.password],
                                onChanged: (value) => ref
                                    .read(signinStateProvider.notifier)
                                    .setPassword(value),
                                validator: (value) {
                                  try {
                                    state.password.validate();
                                  } on PasswordException catch (e) {
                                    return e.message;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              // Sign in button with glow
                              GlowButton(
                                text: tr.action.toUpperCase(),
                                height: 52,
                                isLoading: state is SigninStateSending,
                                onPressed: () => _handleSignin(context, ref),
                              ),
                              const SizedBox(height: 12),
                              // Forgot password link
                              TextButton(
                                onPressed: () =>
                                    context.push('/recover_password'),
                                style: TextButton.styleFrom(
                                  foregroundColor: colors.textSecondary,
                                ),
                                child: Text(
                                  tr.forgot_password,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: colors.textTertiary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const SocialSeparator(),
                        const SizedBox(height: 24),
                        // Google sign in with glass style
                        GoogleSignInComponent(
                          label: Translations.of(context).auth.sign_in_with_google,
                        ),
                        if (Platform.isIOS) ...[
                          const SizedBox(height: 12),
                          const AppleSigninComponent(),
                        ],
                        const SizedBox(height: 32),
                        // No account text
                        Text(
                          tr.no_account_question,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: colors.textTertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // Register link
                        TextButton(
                          onPressed: () => context.pushReplacement('/signup'),
                          child: Text(
                            tr.register,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignin(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context).auth.signin;
    if (!_formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    ref.read(signinStateProvider.notifier).signin().then(
      (value) async {
        final credentials = await ref.read(authRepositoryProvider).get();
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
        context: context,
        title: tr.error_title,
        text: tr.error_message,
      ),
    );
  }
}

/// Glass card container for the form with blur effect
class _GlassFormCard extends StatelessWidget {
  final Widget child;

  const _GlassFormCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          decoration: BoxDecoration(
            // Dark blue tint for contrast
            color: const Color(0xFF0A1628).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.glassBorder),
          ),
          child: Stack(
            children: [
              // Subtle inset highlight
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.05),
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 1.0],
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Glass-styled text field with icon
class _GlassTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const _GlassTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
        ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autofillHints: autofillHints,
        onChanged: onChanged,
        validator: validator,
        style: context.textTheme.bodyLarge?.copyWith(
          color: colors.onBackground,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: colors.textTertiary,
            size: 20,
          ),
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: colors.textTertiary,
          ),
          filled: false,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          errorStyle: TextStyle(
            color: colors.error,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
