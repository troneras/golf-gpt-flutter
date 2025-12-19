import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_course_state.freezed.dart';

@freezed
sealed class SelectCourseState with _$SelectCourseState {
  const factory SelectCourseState.loading() = SelectCourseStateLoading;

  const factory SelectCourseState.loaded({
    required Course course,
    Tee? selectedTee,
    @Default(false) bool isManuallySelected,
    @Default(true) bool gpsEnabled,
  }) = SelectCourseStateLoaded;

  const factory SelectCourseState.noCourseFound() = SelectCourseStateNoCourseFound;

  const factory SelectCourseState.error({
    required String message,
  }) = SelectCourseStateError;

  const SelectCourseState._();
}
