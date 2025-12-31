import 'package:another_flushbar/flushbar.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

final toastProvider = Provider<ToastBuilder>((ref) => ToastBuilder());

class ToastBuilder {
  void success({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
  }) {
    showSuccessToast(
      context: navigatorKey.currentContext!,
      title: title,
      text: text,
      duration: duration,
    );
  }

  void error({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
    String? reason,
  }) {
    showErrorToast(
      context: navigatorKey.currentContext!,
      title: title,
      text: text,
      duration: duration,
      reason: reason,
    );
  }

  void alert({
    required String title,
    required String text,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }
    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }
    final colors = context.colors;
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: title,
      message: text,
      titleSize: 16,
      messageSize: 14,
      duration: duration,
      backgroundColor: const Color(0xFF3A3A3A).withValues(alpha: 0.95),
      titleColor: colors.onSurface,
      messageColor: colors.onSurface.withValues(alpha: 0.7),
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      icon: Icon(
        Icons.info_outline,
        color: colors.warning,
        size: 24,
      ),
      shouldIconPulse: false,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ).show(context);
  }
}

void showSuccessToast({
  required BuildContext context,
  required String title,
  required String text,
  Duration duration = const Duration(seconds: 3),
}) {
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    return;
  }
  if (!context.mounted) {
    return;
  }
  final colors = context.colors;
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: text,
    titleSize: 16,
    messageSize: 14,
    duration: duration,
    backgroundColor: const Color(0xFF3A3A3A).withValues(alpha: 0.95),
    titleColor: colors.onSurface,
    messageColor: colors.onSurface.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(12),
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    icon: Icon(
      Icons.check_circle_outline,
      color: colors.success,
      size: 24,
    ),
    shouldIconPulse: false,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ).show(context);
}

void showErrorToast({
  required BuildContext context,
  required String title,
  required String text,
  Duration duration = const Duration(seconds: 3),
  String? reason,
}) {
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    return;
  }
  if (!context.mounted) {
    return;
  }
  final colors = context.colors;
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: text,
    titleSize: 16,
    messageSize: 14,
    duration: duration,
    backgroundColor: const Color(0xFF3A3A3A).withValues(alpha: 0.95),
    titleColor: colors.onSurface,
    messageColor: colors.onSurface.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(12),
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    icon: Icon(
      Icons.error_outline,
      color: colors.error,
      size: 24,
    ),
    shouldIconPulse: false,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ).show(context);
}
