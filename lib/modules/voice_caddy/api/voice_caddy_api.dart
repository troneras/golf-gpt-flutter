import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/modules/voice_caddy/api/entities/gpt_connection_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final voiceCaddyApiProvider = Provider<VoiceCaddyApi>((ref) {
  return VoiceCaddyApi(
    client: ref.read(httpClientProvider),
  );
});

class VoiceCaddyApi {
  final HttpClient _client;

  VoiceCaddyApi({
    required HttpClient client,
  }) : _client = client;

  /// Check the GPT connection status for a user
  Future<GptConnectionEntity> checkConnectionStatus(String userId) async {
    try {
      final response = await _client.get('/users/$userId/gpt-connection');
      return GptConnectionEntity.fromJson(response.data as Map<String, Object?>);
    } on DioException catch (e) {
      // If endpoint doesn't exist yet or returns 404, return default (not connected)
      if (e.response?.statusCode == 404) {
        return const GptConnectionEntity();
      }
      rethrow;
    }
  }

  /// Force refresh the connection status (triggers backend to check with OpenAI)
  Future<GptConnectionEntity> refreshConnectionStatus(String userId) async {
    try {
      final response =
          await _client.post('/users/$userId/gpt-connection/check');
      return GptConnectionEntity.fromJson(response.data as Map<String, Object?>);
    } on DioException catch (e) {
      // If endpoint doesn't exist yet, return default
      if (e.response?.statusCode == 404) {
        return const GptConnectionEntity();
      }
      rethrow;
    }
  }

  /// Disconnect from GPT - revokes all OAuth tokens
  Future<void> disconnectGpt(String userId) async {
    try {
      await _client.delete('/users/$userId/gpt-connection');
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
