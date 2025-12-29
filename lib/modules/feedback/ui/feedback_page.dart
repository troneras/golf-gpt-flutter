import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/buttons.dart';
import 'package:apparence_kit/core/widgets/toast.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/feedback/providers/feedback_state_provider.dart';
import 'package:apparence_kit/modules/feedback/providers/models/feedback_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class FeedbackPage extends ConsumerWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedbackStateProvider);
    final tr = Translations.of(context).feedback;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: context.colors.background,
        appBar: AppBar(
          backgroundColor: context.colors.background,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text(
            tr.title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: switch (state) {
            FeedbackStateSuccess() => _FeedbackSuccessView(tr: tr),
            _ => _FeedbackFormView(state: state, tr: tr),
          },
        ),
      ),
    );
  }
}

class _FeedbackFormView extends ConsumerWidget {
  final FeedbackState state;
  final TranslationsFeedbackEs tr;

  const _FeedbackFormView({
    required this.state,
    required this.tr,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSending = state is FeedbackStateSending;
    final currentCategory = switch (state) {
      FeedbackStateData(:final category) => category,
      FeedbackStateSending(:final category) => category,
      FeedbackStateSuccess() => FeedbackCategory.general,
    };
    final colors = context.colors;

    // Matte glass input decoration
    InputDecoration glassInputDecoration({
      required String labelText,
      String? hintText,
      bool alignLabelWithHint = false,
    }) {
      return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: alignLabelWithHint,
        labelStyle: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white.withValues(alpha: 0.7),
        ),
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white.withValues(alpha: 0.5),
        ),
        filled: true,
        fillColor: const Color(0xFF141A24).withValues(alpha: 0.85),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colors.primary.withValues(alpha: 0.6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colors.error.withValues(alpha: 0.6),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colors.error.withValues(alpha: 0.8),
          ),
        ),
        counterStyle: context.textTheme.bodySmall?.copyWith(
          color: Colors.white.withValues(alpha: 0.5),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            // Header icon
            Icon(
              Icons.message_outlined,
              size: 48,
              color: colors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              tr.subtitle,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Category label
            Text(
              tr.category_label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8),
            // Styled dropdown
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF141A24).withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: DropdownButtonFormField<FeedbackCategory>(
                initialValue: currentCategory,
                dropdownColor: const Color(0xFF141A24),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                items: FeedbackCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(_getCategoryLabel(category)),
                  );
                }).toList(),
                onChanged: isSending
                    ? null
                    : (value) {
                        if (value != null) {
                          ref
                              .read(feedbackStateProvider.notifier)
                              .setCategory(value);
                        }
                      },
              ),
            ),
            const SizedBox(height: 24),
            // Subject field
            TextFormField(
              key: const Key('subject_input'),
              enabled: !isSending,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
              onChanged: (value) => ref
                  .read(feedbackStateProvider.notifier)
                  .setSubject(value),
              decoration: glassInputDecoration(
                labelText: tr.subject_label,
                hintText: tr.subject_hint,
              ),
              textInputAction: TextInputAction.next,
              maxLength: 255,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return tr.subject_required;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Message field
            TextFormField(
              key: const Key('message_input'),
              enabled: !isSending,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
              onChanged: (value) => ref
                  .read(feedbackStateProvider.notifier)
                  .setMessage(value),
              decoration: glassInputDecoration(
                labelText: tr.message_label,
                hintText: tr.message_hint,
                alignLabelWithHint: true,
              ),
              textInputAction: TextInputAction.newline,
              maxLines: 6,
              maxLength: 5000,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return tr.message_required;
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            // Primary CTA button with glow
            _PrimaryCTAButton(
              key: const Key('submit_button'),
              onPressed: isSending
                  ? null
                  : () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      FocusScope.of(context).unfocus();
                      ref
                          .read(feedbackStateProvider.notifier)
                          .submit()
                          .then(
                            (_) {},
                            onError: (err) {
                              if (!context.mounted) return;
                              showErrorToast(
                                context: context,
                                title: tr.error_title,
                                text: tr.error_message,
                              );
                            },
                          );
                    },
              isLoading: isSending,
              label: tr.submit,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  String _getCategoryLabel(FeedbackCategory category) {
    return switch (category) {
      FeedbackCategory.general => tr.category_general,
      FeedbackCategory.support => tr.category_support,
      FeedbackCategory.feedback => tr.category_feedback,
      FeedbackCategory.bugReport => tr.category_bug_report,
      FeedbackCategory.featureRequest => tr.category_feature_request,
    };
  }
}

/// Primary CTA button with gradient and glow effect
class _PrimaryCTAButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  const _PrimaryCTAButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isEnabled = onPressed != null && !isLoading;

    if (!isEnabled) {
      // Disabled state
      return Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withValues(alpha: 0.08),
        ),
        child: Center(
          child: isLoading
              ? const ButtonLoading()
              : Text(
                  label,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
        ),
      );
    }

    // Enabled state with gradient and glow
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.primary.withValues(alpha: 0.9),
            colors.primary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              label,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeedbackSuccessView extends ConsumerWidget {
  final TranslationsFeedbackEs tr;

  const _FeedbackSuccessView({required this.tr});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Success card with matte glass
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFF141A24).withValues(alpha: 0.90),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              children: [
                // Success icon with glow
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF6BCF9B).withValues(alpha: 0.15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6BCF9B).withValues(alpha: 0.2),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 48,
                    color: Color(0xFF6BCF9B),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  tr.success_title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  tr.success_message,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Ghost button (secondary style)
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    ref.read(feedbackStateProvider.notifier).reset();
                    context.pop();
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: Text(
                      tr.back,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
