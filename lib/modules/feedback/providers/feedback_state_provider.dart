import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/modules/feedback/api/feedback_api.dart';
import 'package:apparence_kit/modules/feedback/providers/models/feedback_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_state_provider.g.dart';

@riverpod
class FeedbackStateNotifier extends _$FeedbackStateNotifier {
  FeedbackApi get _feedbackApi => ref.read(feedbackApiProvider);

  @override
  FeedbackState build() {
    return const FeedbackState(
      subject: '',
      message: '',
      category: FeedbackCategory.general,
    );
  }

  void setSubject(String value) {
    if (state is! FeedbackStateData) return;
    state = (state as FeedbackStateData).copyWith(subject: value);
  }

  void setMessage(String value) {
    if (state is! FeedbackStateData) return;
    state = (state as FeedbackStateData).copyWith(message: value);
  }

  void setCategory(FeedbackCategory category) {
    if (state is! FeedbackStateData) return;
    state = (state as FeedbackStateData).copyWith(category: category);
  }

  Future<void> submit() async {
    if (state is! FeedbackStateData) return;
    final currentState = state as FeedbackStateData;

    // Validate fields
    if (currentState.subject.trim().isEmpty) {
      state = currentState.copyWith(error: 'subject_required');
      return;
    }
    if (currentState.message.trim().isEmpty) {
      state = currentState.copyWith(error: 'message_required');
      return;
    }

    // Get user info
    final userState = ref.read(userStateNotifierProvider);
    final user = userState.user;

    String name = 'App User';
    String email = 'unknown@talkcaddy.io';

    if (user is AuthenticatedUserData) {
      name = user.name ?? user.email.split('@').first;
      email = user.email;
    }

    state = FeedbackState.sending(
      subject: currentState.subject,
      message: currentState.message,
      category: currentState.category,
    );

    try {
      await _feedbackApi.submitFeedback(
        name: name,
        email: email,
        subject: currentState.subject.trim(),
        message: currentState.message.trim(),
        category: currentState.category.apiValue,
      );
      state = const FeedbackState.success();
    } catch (e) {
      state = FeedbackState(
        subject: currentState.subject,
        message: currentState.message,
        category: currentState.category,
        error: 'submit_failed',
      );
      rethrow;
    }
  }

  void reset() {
    state = const FeedbackState(
      subject: '',
      message: '',
      category: FeedbackCategory.general,
    );
  }
}
