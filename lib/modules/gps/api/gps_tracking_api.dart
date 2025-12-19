import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/modules/gps/api/entities/gps_point_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

final gpsTrackingApiProvider = Provider<GpsTrackingApi>(
  (ref) => GpsTrackingApi(
    client: ref.read(httpClientProvider),
  ),
);

class GpsTrackingApi {
  final HttpClient _client;

  GpsTrackingApi({required HttpClient client}) : _client = client;

  /// Track a GPS point
  /// POST /gps/track
  Future<void> trackPoint(GpsPointEntity point) async {
    _logger.d('API Request: POST /gps/track');
    try {
      final response = await _client.post(
        '/gps/track',
        data: point.toJson(),
      );
      _logger.d('API Response: ${response.statusCode}');
    } on DioException catch (e) {
      _logger.e('DioException tracking GPS: ${e.response?.statusCode} - ${e.message}');
      throw ApiError.fromDioException(e);
    } on ApiError {
      rethrow;
    } catch (e, stackTrace) {
      _logger.e('Error tracking GPS', error: e, stackTrace: stackTrace);
      throw ApiError(code: 0, message: e.toString());
    }
  }

  /// Track multiple GPS points (batch)
  Future<void> trackPoints(List<GpsPointEntity> points) async {
    _logger.d('API Request: Batch tracking ${points.length} GPS points');
    for (final point in points) {
      await trackPoint(point);
    }
    _logger.d('Batch tracking complete');
  }
}
