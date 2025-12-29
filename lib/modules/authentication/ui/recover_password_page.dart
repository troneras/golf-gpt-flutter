import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/app_background.dart';
import 'package:apparence_kit/core/widgets/glass_form_card.dart';
import 'package:apparence_kit/core/widgets/glass_text_field.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email.dart';
import 'package:apparence_kit/modules/authentication/providers/models/recover_state.dart';
import 'package:apparence_kit/modules/authentication/providers/recover_provider.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecoverPasswordPage extends ConsumerStatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  ConsumerState<RecoverPasswordPage> createState() =>
      _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends ConsumerState<RecoverPasswordPage> {
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recoverStateProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: AppBackground(
            child: SafeArea(
              child: Column(
                children: [
                  _buildAppBar(context),
                  Expanded(
                    child: switch (state) {
                      RecoverStateData() => _buildEmailForm(context, state),
                      RecoverStateSending() => _buildLoading(context),
                      RecoverStateCodeEntry() =>
                        _buildCodeEntry(context, state),
                      RecoverStateSuccess() => _buildSuccess(context),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final tr = Translations.of(context).auth.recover_password;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: colors.onBackground),
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: Text(
              tr.title,
              style: context.textTheme.titleLarge?.copyWith(
                color: colors.onBackground,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildEmailForm(BuildContext context, RecoverStateData state) {
    final tr = Translations.of(context).auth.recover_password;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _emailFormKey,
        child: ListView(
          children: [
            const SizedBox(height: 32),
            GlassFormCard(
              child: Column(
                children: [
                  Icon(
                    Icons.lock_reset,
                    size: 56,
                    color: colors.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    tr.email_title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr.email_subtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  GlassTextField(
                    key: const Key('email_input'),
                    icon: Icons.email_outlined,
                    hintText: tr.email_label,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [
                      AutofillHints.username,
                      AutofillHints.email,
                    ],
                    validator: (value) {
                      try {
                        state.email.validate();
                      } on EmailException catch (e) {
                        return e.message;
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        ref.read(recoverStateProvider.notifier).setEmail(value),
                  ),
                  if (state.error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      state.error!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colors.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 20),
                  GlowButton(
                    text: tr.send_code_button.toUpperCase(),
                    height: 52,
                    onPressed: () {
                      if (!_emailFormKey.currentState!.validate()) return;
                      ref.read(recoverStateProvider.notifier).requestCode();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(context.colors.primary),
      ),
    );
  }

  Widget _buildCodeEntry(BuildContext context, RecoverStateCodeEntry state) {
    final tr = Translations.of(context).auth.recover_password;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _passwordFormKey,
        child: ListView(
          children: [
            const SizedBox(height: 32),
            GlassFormCard(
              child: Column(
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 56,
                    color: colors.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    tr.code_title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr.code_subtitle.replaceAll('{email}', state.email.value),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  OtpInput(
                    controller: _otpController,
                    onCompleted: (code) {
                      ref.read(recoverStateProvider.notifier).setCode(code);
                    },
                  ),
                  const SizedBox(height: 20),
                  GlassTextField(
                    key: const Key('password_input'),
                    icon: Icons.lock_outline,
                    hintText: tr.new_password_label,
                    obscureText: true,
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.newPassword],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr.password_required;
                      }
                      if (value.length < 8) {
                        return tr.password_min_length;
                      }
                      return null;
                    },
                    onChanged: (value) => ref
                        .read(recoverStateProvider.notifier)
                        .setPassword(value),
                  ),
                  const SizedBox(height: 12),
                  GlassTextField(
                    key: const Key('confirm_password_input'),
                    icon: Icons.lock_outline,
                    hintText: tr.confirm_password_label,
                    obscureText: true,
                    controller: _confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.newPassword],
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return tr.passwords_not_match;
                      }
                      return null;
                    },
                    onChanged: (value) => ref
                        .read(recoverStateProvider.notifier)
                        .setPasswordConfirmation(value),
                  ),
                  if (state.error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      state.error!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colors.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 20),
                  GlowButton(
                    text: tr.reset_button.toUpperCase(),
                    height: 52,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (!_passwordFormKey.currentState!.validate()) return;
                      ref.read(recoverStateProvider.notifier).setCode(
                            _otpController.text.trim(),
                          );
                      ref.read(recoverStateProvider.notifier).resetPassword();
                    },
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () => ref.read(recoverStateProvider.notifier).reset(),
                    child: Text(
                      tr.back_to_email,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: colors.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    final tr = Translations.of(context).auth.recover_password;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: GlassFormCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: colors.success,
                size: 72,
              ),
              const SizedBox(height: 24),
              Text(
                tr.success_title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.success,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr.success_subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GlowButton(
                text: tr.back_to_signin.toUpperCase(),
                height: 52,
                onPressed: () => context.go('/signin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
