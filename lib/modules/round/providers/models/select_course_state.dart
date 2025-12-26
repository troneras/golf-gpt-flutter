import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_course_state.freezed.dart';

/// Maximum distance in km from course to allow GPS tracking.
/// 10km is a safe threshold - only blocks GPS for obviously wrong course selections.
const double kMaxGpsDistanceKm = 10.0;

/// Result of attempting to toggle GPS setting.
enum GpsToggleResult {
  success,
  /// Location permission not granted
  locationPermissionDenied,
  /// Notification permission not granted (Android) - GPS may not work reliably in background
  notificationPermissionDenied,
  /// GPS was enabled but course is far - UI should show confirmation
  confirmFarCourse,
}

@freezed
sealed class SelectCourseState with _$SelectCourseState {
  const factory SelectCourseState.loading() = SelectCourseStateLoading;

  const factory SelectCourseState.loaded({
    required Course course,
    Tee? selectedTee,
    @Default(false) bool isManuallySelected,
    @Default(false) bool isRecentCourse,
    @Default(true) bool gpsEnabled,
    @Default(false) bool gpsTooFar,
  }) = SelectCourseStateLoaded;

  const factory SelectCourseState.noCourseFound() = SelectCourseStateNoCourseFound;

  /// State that signals the UI to redirect to the browse courses search tab.
  /// Used when no recent course found and no GPS permission/nearby course.
  const factory SelectCourseState.redirectToSearch() = SelectCourseStateRedirectToSearch;

  const factory SelectCourseState.error({
    required String message,
  }) = SelectCourseStateError;

  const SelectCourseState._();
}
