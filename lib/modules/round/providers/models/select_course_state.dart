import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_course_state.freezed.dart';

/// Maximum distance in km from course to allow GPS tracking.
/// 10km is a safe threshold - only blocks GPS for obviously wrong course selections.
const double kMaxGpsDistanceKm = 10.0;

@freezed
sealed class SelectCourseState with _$SelectCourseState {
  const factory SelectCourseState.loading() = SelectCourseStateLoading;

  const factory SelectCourseState.loaded({
    required Course course,
    Tee? selectedTee,
    @Default(false) bool isManuallySelected,
    @Default(true) bool gpsEnabled,
    @Default(false) bool gpsTooFar,
  }) = SelectCourseStateLoaded;

  const factory SelectCourseState.noCourseFound() = SelectCourseStateNoCourseFound;

  const factory SelectCourseState.error({
    required String message,
  }) = SelectCourseStateError;

  const SelectCourseState._();
}
