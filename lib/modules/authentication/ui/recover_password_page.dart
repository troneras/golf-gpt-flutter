import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/buttons.dart';
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
  ConsumerState<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
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
    final tr = Translations.of(context).auth.recover_password;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr.title),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: switch (state) {
              RecoverStateData() => _buildEmailForm(context, state),
              RecoverStateSending() => _buildLoading(context),
              RecoverStateCodeEntry() => _buildCodeEntry(context, state),
              RecoverStateSuccess() => _buildSuccess(context),
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm(BuildContext context, RecoverStateData state) {
    final tr = Translations.of(context).auth.recover_password;

    return AutofillGroup(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _emailFormKey,
          child: ListView(
            children: [
              const SizedBox(height: 48),
              Icon(
                Icons.lock_reset,
                size: 72,
                color: context.colors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                tr.email_title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr.email_subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onBackground.withValues(alpha: .7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                key: const Key('email_input'),
                decoration: InputDecoration(
                  labelText: tr.email_label,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.username, AutofillHints.email],
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
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                key: const Key('recover_button'),
                onPressed: () {
                  if (!_emailFormKey.currentState!.validate()) return;
                  ref.read(recoverStateProvider.notifier).requestCode();
                },
                child: Text(tr.send_code_button),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
      ),
    );
  }

  Widget _buildCodeEntry(BuildContext context, RecoverStateCodeEntry state) {
    final tr = Translations.of(context).auth.recover_password;

    return AutofillGroup(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _passwordFormKey,
          child: ListView(
            children: [
              const SizedBox(height: 32),
              Icon(
                Icons.email_outlined,
                size: 72,
                color: context.colors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                tr.code_title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr.code_subtitle.replaceAll('{email}', state.email.value),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onBackground.withValues(alpha: .7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OtpInput(
                controller: _otpController,
                onCompleted: (code) {
                  ref.read(recoverStateProvider.notifier).setCode(code);
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                key: const Key('password_input'),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: tr.new_password_label,
                ),
                obscureText: true,
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
                onChanged: (value) =>
                    ref.read(recoverStateProvider.notifier).setPassword(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('confirm_password_input'),
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: tr.confirm_password_label,
                ),
                obscureText: true,
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
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        if (!_passwordFormKey.currentState!.validate()) return;
                        ref.read(recoverStateProvider.notifier).setCode(
                              _otpController.text.trim(),
                            );
                        ref.read(recoverStateProvider.notifier).resetPassword();
                      },
                child: state.isLoading
                    ? const ButtonLoading()
                    : Text(tr.reset_button),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: state.isLoading
                    ? null
                    : () => ref.read(recoverStateProvider.notifier).reset(),
                child: Text(tr.back_to_email),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    final tr = Translations.of(context).auth.recover_password;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 72,
            ),
            const SizedBox(height: 24),
            Text(
              tr.success_title,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              tr.success_subtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onBackground.withValues(alpha: .7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go('/signin'),
              child: Text(tr.back_to_signin),
            ),
          ],
        ),
      ),
    );
  }
}
