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

  Future<List<Course>> getNearby({
    required double latitude,
    required double longitude,
    int radius = 2000,
    int limit = 20,
  }) async {
    final entities = await _courseApi.getNearby(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      limit: limit,
    );
    return entities.map(Course.fromEntity).toList();
  }

  Future<List<Course>> getRecent() async {
    final entities = await _courseApi.getRecent();
    return entities.map(Course.fromEntity).toList();
  }

  Future<List<Course>> search(String query) async {
    final entities = await _courseApi.search(query);
    return entities.map(Course.fromEntity).toList();
  }

  Future<Course?> getCourseDetails(String courseId) async {
    final entity = await _courseApi.getCourseDetails(courseId);
    if (entity == null) {
      return null;
    }
    return Course.fromEntity(entity);
  }
}
