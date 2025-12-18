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
}
