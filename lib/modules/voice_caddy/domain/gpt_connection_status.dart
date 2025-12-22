import 'package:apparence_kit/modules/voice_caddy/api/entities/gpt_connection_entity.dart';

/// Domain model for GPT connection status
class GptConnectionStatus {
  final bool hasCompletedOauth;
  final DateTime? lastInteraction;

  const GptConnectionStatus({
    required this.hasCompletedOauth,
    this.lastInteraction,
  });

  factory GptConnectionStatus.fromEntity(GptConnectionEntity entity) {
    return GptConnectionStatus(
      hasCompletedOauth: entity.hasCompletedOauth,
      lastInteraction: entity.lastInteraction,
    );
  }

  /// Default status when not connected
  factory GptConnectionStatus.notConnected() {
    return const GptConnectionStatus(hasCompletedOauth: false);
  }

  /// Check if the user has connected their GPT account
  bool get isConnected => hasCompletedOauth;

  /// Check if the user has interacted with the GPT recently (within last 24 hours)
  bool get hasRecentInteraction {
    if (lastInteraction == null) return false;
    final now = DateTime.now();
    final difference = now.difference(lastInteraction!);
    return difference.inHours < 24;
  }
}
