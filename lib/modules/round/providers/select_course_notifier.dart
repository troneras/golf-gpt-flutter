import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:apparence_kit/modules/round/providers/models/select_course_state.dart';
import 'package:apparence_kit/modules/round/repositories/course_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_course_notifier.g.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

@riverpod
class SelectCourseNotifier extends _$SelectCourseNotifier {
  CourseRepository get _courseRepository => ref.read(courseRepositoryProvider);

  @override
  SelectCourseState build() {
    _loadClosestCourse();
    return const SelectCourseState.loading();
  }

  Future<void> _loadClosestCourse() async {
    try {
      _logger.i('Getting current GPS position...');
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      _logger.i('GPS position: lat=${position.latitude}, lng=${position.longitude}');
      _logger.i('Fetching closest course from API...');
      final course = await _courseRepository.getClosestCourse(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      if (course == null) {
        _logger.w('No course found nearby');
        state = const SelectCourseState.noCourseFound();
        return;
      }
      _logger.i('Found course: ${course.name} at ${course.distanceKm?.toStringAsFixed(2)} km');
      _logger.d('Course tees: ${course.tees.map((t) => t.name).join(', ')}');
      state = SelectCourseState.loaded(course: course);
    } catch (e, stackTrace) {
      _logger.e('Error loading closest course', error: e, stackTrace: stackTrace);
      state = SelectCourseState.error(message: e.toString());
    }
  }

  void selectTee(Tee tee) {
    final currentState = state;
    if (currentState is SelectCourseStateLoaded) {
      state = currentState.copyWith(selectedTee: tee);
    }
  }

  void retry() {
    state = const SelectCourseState.loading();
    _loadClosestCourse();
  }
}
