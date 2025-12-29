import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// Glass-styled text field with icon for forms.
class GlassTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const GlassTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.controller,
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
        controller: controller,
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
