import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/phone_auth_notifier.dart';
import 'package:apparence_kit/modules/authentication/ui/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpVerificationComponent extends ConsumerStatefulWidget {
  const OtpVerificationComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtpVerificationComponentState();
}

class _OtpVerificationComponentState
    extends ConsumerState<OtpVerificationComponent> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(phoneAuthProvider);
    final tr = Translations.of(context).auth.phone_auth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Icon(Icons.sms_outlined, size: 72, color: context.colors.primary),
        const SizedBox(height: 24),
        Text(
          tr.verification_code,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          tr.code_sent_to.replaceAll('{phone}', state.phoneNumber),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onBackground.withValues(alpha: .7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        OtpInput(
          controller: _otpController,
          onCompleted: (otp) {
            if (!state.isLoading) {
              ref.read(phoneAuthProvider.notifier).verifyOtp(otp);
            }
          },
        ),
        if (state.error != null) ...[
          const SizedBox(height: 16),
          Text(
            state.error!,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () {
                  final otp = _otpController.text.trim();
                  if (otp.length == 6) {
                    ref.read(phoneAuthProvider.notifier).verifyOtp(otp);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(tr.enter_all_digits),
                      ),
                    );
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.primary,
            foregroundColor: context.colors.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBackgroundColor: context.colors.primary.withValues(
              alpha: .5,
            ),
          ),
          child: state.isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(tr.verify_code),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: state.isLoading
              ? null
              : () {
                  ref
                      .read(phoneAuthProvider.notifier)
                      .sendOtp(state.phoneNumber);
                },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            tr.resend_code,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
