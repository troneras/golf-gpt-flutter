import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/app_background.dart';
import 'package:apparence_kit/core/widgets/glass_form_card.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/email_verification_notifier.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email_verification_state.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationPage extends ConsumerStatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  ConsumerState<EmailVerificationPage> createState() =>
      _EmailVerificationPageState();
}

class _EmailVerificationPageState extends ConsumerState<EmailVerificationPage> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailVerificationProvider);

    ref.listen(emailVerificationProvider, (previous, next) async {
      if (next is EmailVerificationVerified) {
        await ref.read(userStateNotifierProvider.notifier).onOnboarded();
        if (context.mounted) {
          context.go('/');
        }
      }
    });

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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _buildContent(context, state),
                    ),
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
    final tr = Translations.of(context).auth.email_verification;
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

  Widget _buildContent(BuildContext context, EmailVerificationState state) {
    final tr = Translations.of(context).auth.email_verification;
    final colors = context.colors;

    final isLoading = switch (state) {
      EmailVerificationStateData(:final isLoading) => isLoading,
      EmailVerificationVerified() => false,
    };

    final email = switch (state) {
      EmailVerificationStateData(:final email) => email,
      EmailVerificationVerified() => '',
    };

    final error = switch (state) {
      EmailVerificationStateData(:final error) => error,
      EmailVerificationVerified() => null,
    };

    return Column(
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
                tr.code_sent_title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                tr.subtitle.replaceAll('{email}', email),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OtpInput(
                controller: _otpController,
                onCompleted: (code) {
                  if (!isLoading) {
                    ref.read(emailVerificationProvider.notifier).verifyCode(code);
                  }
                },
              ),
              if (error != null) ...[
                const SizedBox(height: 12),
                Text(
                  error,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 20),
              GlowButton(
                text: tr.verify_button.toUpperCase(),
                height: 52,
                isLoading: isLoading,
                onPressed: () {
                  final code = _otpController.text.trim();
                  if (code.length == 6) {
                    ref.read(emailVerificationProvider.notifier).verifyCode(code);
                  }
                },
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: isLoading
                    ? null
                    : () => ref.read(emailVerificationProvider.notifier).sendCode(),
                child: Text(
                  tr.resend_code,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
