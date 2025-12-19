import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_state.freezed.dart';

enum FeedbackCategory {
  general,
  support,
  feedback,
  bugReport,
  featureRequest;

  String get apiValue => switch (this) {
    FeedbackCategory.general => 'general',
    FeedbackCategory.support => 'support',
    FeedbackCategory.feedback => 'feedback',
    FeedbackCategory.bugReport => 'bug_report',
    FeedbackCategory.featureRequest => 'feature_request',
  };
}

@freezed
sealed class FeedbackState with _$FeedbackState {
  const factory FeedbackState({
    required String subject,
    required String message,
    required FeedbackCategory category,
    String? error,
  }) = FeedbackStateData;

  const factory FeedbackState.sending({
    required String subject,
    required String message,
    required FeedbackCategory category,
  }) = FeedbackStateSending;

  const factory FeedbackState.success() = FeedbackStateSuccess;

  const FeedbackState._();
}
