import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final feedbackApiProvider = Provider<FeedbackApi>(
  (ref) => HttpFeedbackApi(
    logger: Logger(),
    client: ref.read(httpClientProvider),
  ),
);

abstract class FeedbackApi {
  Future<String> submitFeedback({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String category,
  });
}

class HttpFeedbackApi implements FeedbackApi {
  final Logger _logger;
  final HttpClient _client;

  HttpFeedbackApi({
    required Logger logger,
    required HttpClient client,
  })  : _logger = logger,
        _client = client;

  @override
  Future<String> submitFeedback({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String category,
  }) async {
    try {
      final response = await _client.post(
        '/contact',
        data: {
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
          'category': category,
        },
        options: Options(
          headers: {
            'X-Source': 'app',
          },
        ),
      );
      final data = response.data as Map<String, dynamic>;
      return data['submission_id'] as String;
    } on DioException catch (e, stackTrace) {
      _logger.e('Failed to submit feedback', error: e, stackTrace: stackTrace);
      throw ApiError.fromDioException(e);
    } catch (e, stackTrace) {
      _logger.e('Failed to submit feedback', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: '$e');
    }
  }
}
