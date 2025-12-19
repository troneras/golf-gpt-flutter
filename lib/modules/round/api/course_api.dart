import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/modules/round/api/entities/course_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

final courseApiProvider = Provider<CourseApi>(
  (ref) => CourseApi(
    client: ref.read(httpClientProvider),
  ),
);

class CourseApi {
  final HttpClient _client;

  CourseApi({required HttpClient client}) : _client = client;

  Future<CourseEntity?> getClosestCourse({
    required double latitude,
    required double longitude,
  }) async {
    _logger.i('API Request: GET /courses/closest?lat=$latitude&lng=$longitude');
    _logger.d('Base URL: ${_client.options.baseUrl}');
    try {
      final response = await _client.get(
        '/courses/closest',
        queryParameters: {
          'lat': latitude,
          'lng': longitude,
        },
      );
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      if (response.statusCode == 404) {
        _logger.w('No course found (404)');
        return null;
      }
      final data = response.data as Map<String, dynamic>;
      final courseResponse = ClosestCourseResponse.fromJson(data);
      _logger.i('Parsed course: ${courseResponse.course.name}');
      return courseResponse.course;
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      _logger.d('Response body: ${e.response?.data}');
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  Future<CourseEntity?> getCourseDetails(String courseId) async {
    _logger.i('API Request: GET /courses/$courseId');
    try {
      final response = await _client.get('/courses/$courseId');
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      if (response.statusCode == 404) {
        return null;
      }
      final data = response.data as Map<String, dynamic>;
      // Handle wrapped response { "course": {...} } or direct {...}
      final courseData = data.containsKey('course')
          ? data['course'] as Map<String, dynamic>
          : data;
      return CourseEntity.fromJson(courseData);
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  Future<List<CourseEntity>> getNearby({
    required double latitude,
    required double longitude,
    int radius = 50,
    int limit = 20,
  }) async {
    _logger.i('API Request: GET /courses/nearby?lat=$latitude&lng=$longitude&radius=$radius&limit=$limit');
    try {
      final response = await _client.get(
        '/courses/nearby',
        queryParameters: {
          'lat': latitude,
          'lng': longitude,
          'radius': radius,
          'limit': limit,
        },
      );
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final List<dynamic> data = _extractList(response.data);
      final courses = data
          .map((e) => NearbyCourseEntity.fromJson(e as Map<String, dynamic>).toCourseEntity())
          .toList();
      _logger.i('Parsed ${courses.length} nearby courses');
      return courses;
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  Future<List<CourseEntity>> getRecent() async {
    _logger.i('API Request: GET /courses/recent');
    try {
      final response = await _client.get('/courses/recent');
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final List<dynamic> data = _extractList(response.data);
      final courses = data
          .map((e) => CourseEntity.fromJson(e as Map<String, dynamic>))
          .toList();
      _logger.i('Parsed ${courses.length} recent courses');
      return courses;
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  Future<List<CourseEntity>> search(String query) async {
    _logger.i('API Request: GET /courses/search?query=$query');
    if (query.length < 3) {
      return [];
    }
    try {
      final response = await _client.get(
        '/courses/search',
        queryParameters: {'q': query},
      );
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final List<dynamic> data = _extractList(response.data);
      final courses = data
          .map((e) => NearbyCourseEntity.fromJson(e as Map<String, dynamic>).toCourseEntity())
          .toList();
      _logger.i('Parsed ${courses.length} search results');
      return courses;
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  List<dynamic> _extractList(dynamic responseData) {
    if (responseData is List) {
      return responseData;
    }
    if (responseData is Map<String, dynamic>) {
      // Array wrapped in "data" or "courses" key
      if (responseData.containsKey('data')) {
        final data = responseData['data'];
        if (data is List) return data;
      }
      if (responseData.containsKey('courses')) {
        final courses = responseData['courses'];
        if (courses is List) return courses;
      }
      // Single course wrapped in "course" key - wrap in list
      if (responseData.containsKey('course')) {
        final course = responseData['course'];
        if (course is Map<String, dynamic>) return [course];
      }
    }
    return [];
  }
}
