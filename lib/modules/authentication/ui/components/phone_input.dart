import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/authentication/providers/phone_auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneInputComponent extends ConsumerStatefulWidget {
  const PhoneInputComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneInputComponentState();
}

class _PhoneInputComponentState extends ConsumerState<PhoneInputComponent> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(phoneAuthProvider);
    final tr = Translations.of(context).auth.phone_auth;
    final commonTr = Translations.of(context).common;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Icon(Icons.phone_android, size: 72, color: context.colors.primary),
          const SizedBox(height: 24),
          Text(
            tr.enter_phone,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            tr.send_code_info,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onBackground.withValues(alpha: .7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colors.error,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  state.error!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.background,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: tr.phone_label,
              hintText: tr.phone_hint,
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.phone_required;
              }
              // Simple validation for demo purposes
              if (value.replaceAll(RegExp(r'[^0-9+]'), '').length < 7) {
                return tr.phone_invalid;
              }
              return null;
            },
            inputFormatters: [
              // Allow digits, +, - and spaces
              FilteringTextInputFormatter.allow(RegExp(r'[0-9+\- ]')),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(phoneAuthProvider.notifier)
                          .sendOtp(_phoneController.text.trim());
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
                : Text(commonTr.kContinue),
          ),
        ],
      ),
    );
  }
}
