import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/buttons.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/email_verification_notifier.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email_verification_state.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/otp_input.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailVerificationProvider);
    final tr = Translations.of(context).auth.email_verification;

    ref.listen(emailVerificationProvider, (previous, next) {
      if (next is EmailVerificationVerified) {
        context.go('/complete');
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: context.colors.background,
        appBar: AppBar(
          title: Text(tr.title),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContent(context, state),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, EmailVerificationState state) {
    final tr = Translations.of(context).auth.email_verification;

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Icon(
          Icons.email_outlined,
          size: 72,
          color: context.colors.primary,
        ),
        const SizedBox(height: 24),
        Text(
          tr.code_sent_title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          tr.subtitle.replaceAll('{email}', email),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onBackground.withValues(alpha: .7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        OtpInput(
          controller: _otpController,
          onCompleted: (code) {
            if (!isLoading) {
              ref.read(emailVerificationProvider.notifier).verifyCode(code);
            }
          },
        ),
        if (error != null) ...[
          const SizedBox(height: 16),
          Text(
            error,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.error,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  final code = _otpController.text.trim();
                  if (code.length == 6) {
                    ref.read(emailVerificationProvider.notifier).verifyCode(code);
                  }
                },
          child: isLoading ? const ButtonLoading() : Text(tr.verify_button),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: isLoading
              ? null
              : () => ref.read(emailVerificationProvider.notifier).sendCode(),
          child: Text(tr.resend_code),
        ),
      ],
    );
  }
}
