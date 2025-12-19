import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/modules/bag/api/entities/club_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

final bagApiProvider = Provider<BagApi>(
  (ref) => BagApi(
    client: ref.read(httpClientProvider),
  ),
);

class BagApi {
  final HttpClient _client;

  BagApi({required HttpClient client}) : _client = client;

  /// Get user's golf bag with all clubs
  /// GET /api/bag
  Future<List<ClubEntity>> getClubs() async {
    _logger.i('API Request: GET /bag');
    try {
      final response = await _client.get('/bag');
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final data = response.data as Map<String, dynamic>;
      final bagResponse = BagResponse.fromJson(data);
      return bagResponse.clubs;
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

  /// Add a new club to the bag
  /// POST /api/bag/clubs
  Future<ClubEntity> addClub({
    required String clubType,
    int? distanceYards,
  }) async {
    _logger.i('API Request: POST /bag/clubs');
    try {
      final data = <String, dynamic>{
        'club_type': clubType,
      };
      if (distanceYards != null) {
        data['distance_yards'] = distanceYards;
      }
      final response = await _client.post('/bag/clubs', data: data);
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      final clubResponse = ClubResponse.fromJson(responseData);
      return clubResponse.club;
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

  /// Record a new distance for a club
  /// POST /api/bag/clubs/{clubId}/distances
  Future<ClubEntity> recordDistance({
    required String clubId,
    required int distanceYards,
  }) async {
    _logger.i('API Request: POST /bag/clubs/$clubId/distances');
    try {
      final response = await _client.post(
        '/bag/clubs/$clubId/distances',
        data: {
          'distance_yards': distanceYards,
          'source': 'manual',
        },
      );
      _logger.i('API Response: ${response.statusCode}');
      _logger.d('Response data: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      final clubData = responseData['club'] as Map<String, dynamic>;
      return ClubEntity.fromJson(clubData);
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

  /// Delete a club from the bag
  /// DELETE /api/bag/clubs/{clubId}
  Future<void> deleteClub(String clubId, {bool permanent = false}) async {
    _logger.i('API Request: DELETE /bag/clubs/$clubId');
    try {
      await _client.delete(
        '/bag/clubs/$clubId',
        queryParameters: {'permanent': permanent},
      );
      _logger.i('API Response: 204');
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
