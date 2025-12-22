import 'package:apparence_kit/modules/voice_caddy/api/voice_caddy_api.dart';
import 'package:apparence_kit/modules/voice_caddy/domain/gpt_connection_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final voiceCaddyRepositoryProvider = Provider<VoiceCaddyRepository>((ref) {
  return VoiceCaddyRepository(
    api: ref.read(voiceCaddyApiProvider),
  );
});

class VoiceCaddyRepository {
  final VoiceCaddyApi _api;

  VoiceCaddyRepository({
    required VoiceCaddyApi api,
  }) : _api = api;

  /// Check the GPT connection status for a user
  Future<GptConnectionStatus> checkConnectionStatus(String userId) async {
    try {
      final entity = await _api.checkConnectionStatus(userId);
      return GptConnectionStatus.fromEntity(entity);
    } catch (e) {
      // If there's an error, return not connected status
      return GptConnectionStatus.notConnected();
    }
  }

  /// Force refresh the connection status
  Future<GptConnectionStatus> refreshConnectionStatus(String userId) async {
    try {
      final entity = await _api.refreshConnectionStatus(userId);
      return GptConnectionStatus.fromEntity(entity);
    } catch (e) {
      // If there's an error, return not connected status
      return GptConnectionStatus.notConnected();
    }
  }
}
