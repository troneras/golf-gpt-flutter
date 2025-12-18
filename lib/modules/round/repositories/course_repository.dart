import 'package:apparence_kit/modules/round/api/course_api.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseRepositoryProvider = Provider<CourseRepository>(
  (ref) => CourseRepository(
    courseApi: ref.read(courseApiProvider),
  ),
);

class CourseRepository {
  final CourseApi _courseApi;

  CourseRepository({required CourseApi courseApi}) : _courseApi = courseApi;

  Future<Course?> getClosestCourse({
    required double latitude,
    required double longitude,
  }) async {
    final entity = await _courseApi.getClosestCourse(
      latitude: latitude,
      longitude: longitude,
    );
    if (entity == null) {
      return null;
    }
    return Course.fromEntity(entity);
  }
}
