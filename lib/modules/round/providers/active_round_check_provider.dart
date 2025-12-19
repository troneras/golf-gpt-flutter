import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/repositories/round_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_round_check_provider.g.dart';

/// Provider that checks for any active round.
/// Returns the active round if one exists, null otherwise.
@riverpod
Future<Round?> activeRoundCheck(Ref ref) async {
  final repository = ref.read(roundRepositoryProvider);
  final rounds = await repository.getRounds(status: 'active', limit: 1);
  return rounds.isNotEmpty ? rounds.first : null;
}
