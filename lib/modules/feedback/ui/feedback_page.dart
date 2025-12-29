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
        appBar: AppBar(
          title: Text(tr.title),
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

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Text(
              tr.subtitle,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onBackground.withValues(alpha: .7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              tr.category_label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<FeedbackCategory>(
              initialValue: currentCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
            const SizedBox(height: 24),
            TextFormField(
              key: const Key('subject_input'),
              enabled: !isSending,
              onChanged: (value) => ref
                  .read(feedbackStateProvider.notifier)
                  .setSubject(value),
              decoration: InputDecoration(
                hintText: tr.subject_hint,
                labelText: tr.subject_label,
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
            TextFormField(
              key: const Key('message_input'),
              enabled: !isSending,
              onChanged: (value) => ref
                  .read(feedbackStateProvider.notifier)
                  .setMessage(value),
              decoration: InputDecoration(
                hintText: tr.message_hint,
                labelText: tr.message_label,
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
            ElevatedButton(
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
              child: isSending ? const ButtonLoading() : Text(tr.submit),
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
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: context.colors.primary,
          ),
          const SizedBox(height: 24),
          Text(
            tr.success_title,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            tr.success_message,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onBackground.withValues(alpha: .7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              ref.read(feedbackStateProvider.notifier).reset();
              context.pop();
            },
            child: Text(tr.back),
          ),
        ],
      ),
    );
  }
}
