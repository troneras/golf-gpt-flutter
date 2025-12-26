import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/modules/round/api/entities/round_entity.dart';
import 'package:apparence_kit/modules/round/api/entities/score_upsert_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

final roundApiProvider = Provider<RoundApi>(
  (ref) => RoundApi(
    client: ref.read(httpClientProvider),
  ),
);

class RoundApi {
  final HttpClient _client;

  RoundApi({required HttpClient client}) : _client = client;

  /// Start a new round
  /// POST /api/rounds
  Future<RoundEntity> startRound({
    required String courseId,
    required String teeId,
    bool gpsEnabled = true,
    bool chatgptEnabled = true,
  }) async {
    _logger.i('API Request: POST /rounds');
    try {
      final response = await _client.post(
        '/rounds',
        data: {
          'course_id': courseId,
          'tee_id': teeId,
          'gps_enabled': gpsEnabled,
          'chatgpt_enabled': chatgptEnabled,
        },
      );
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final data = response.data as Map<String, dynamic>;
      final roundResponse = RoundResponse.fromJson(data);
      return roundResponse.round;
    } on DioException catch (e) {
      _logger.e('DioException: ${e.response?.statusCode} - ${e.message}');
      _logger.d('Response body: ${e.response?.data}');
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Unexpected error', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  /// Get round details with scores
  /// GET /api/rounds/{id}
  Future<RoundEntity> getRound(String roundId) async {
    _logger.i('API Request: GET /rounds/$roundId');
    try {
      final response = await _client.get('/rounds/$roundId');
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final data = response.data as Map<String, dynamic>;
      final roundResponse = RoundResponse.fromJson(data);
      return roundResponse.round;
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

  /// Update round settings (gps_enabled, chatgpt_enabled, notes, etc.)
  /// PUT /api/rounds/{id}
  Future<RoundEntity> updateRound(
    String roundId, {
    bool? gpsEnabled,
    bool? chatgptEnabled,
    String? notes,
  }) async {
    _logger.i('API Request: PUT /rounds/$roundId');
    try {
      final data = <String, dynamic>{};
      if (gpsEnabled != null) data['gps_enabled'] = gpsEnabled;
      if (chatgptEnabled != null) data['chatgpt_enabled'] = chatgptEnabled;
      if (notes != null) data['notes'] = notes;

      final response = await _client.put('/rounds/$roundId', data: data);
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      final roundResponse = RoundResponse.fromJson(responseData);
      return roundResponse.round;
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

  /// Upsert a hole score (idempotent)
  /// POST /v1/scores/upsert
  Future<ScoreUpsertResponse> upsertScore({
    required String roundId,
    required int hole,
    int? strokes,
    int? putts,
    int? penalties,
    bool? fairwayHit,
    bool? gir,
  }) async {
    _logger.i('API Request: POST /v1/scores/upsert (hole $hole)');
    try {
      final data = <String, dynamic>{
        'roundId': roundId,
        'hole': hole,
      };
      if (strokes != null) data['strokes'] = strokes;
      if (putts != null) data['putts'] = putts;
      if (penalties != null) data['penalties'] = penalties;
      if (fairwayHit != null) data['fairwayHit'] = fairwayHit;
      if (gir != null) data['gir'] = gir;

      final response = await _client.post('/v1/scores/upsert', data: data);
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      return ScoreUpsertResponse.fromJson(responseData);
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

  /// Finish the active round
  /// POST /v1/rounds/finish
  Future<FinishRoundResponse> finishRound({String? notes}) async {
    _logger.i('API Request: POST /v1/rounds/finish');
    try {
      final data = <String, dynamic>{};
      if (notes != null) data['notes'] = notes;

      final response = await _client.post('/v1/rounds/finish', data: data);
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      return FinishRoundResponse.fromJson(responseData);
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

  /// Get list of user's rounds
  /// GET /api/rounds
  Future<RoundsListResponse> getRounds({
    String? status,
    int limit = 20,
    int offset = 0,
  }) async {
    _logger.i('API Request: GET /rounds');
    try {
      final queryParams = <String, dynamic>{
        'limit': limit,
        'offset': offset,
      };
      if (status != null) queryParams['status'] = status;

      final response = await _client.get('/rounds', queryParameters: queryParams);
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final data = response.data as Map<String, dynamic>;
      return RoundsListResponse.fromJson(data);
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

  /// Discard a round without saving statistics
  /// POST /api/rounds/{id}/discard
  Future<RoundEntity> discardRound(String roundId) async {
    _logger.i('API Request: POST /rounds/$roundId/discard');
    try {
      final response = await _client.post('/rounds/$roundId/discard');
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final data = response.data as Map<String, dynamic>;
      final roundResponse = RoundResponse.fromJson(data);
      return roundResponse.round;
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
}
