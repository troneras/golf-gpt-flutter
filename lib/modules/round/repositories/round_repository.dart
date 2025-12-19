import 'package:apparence_kit/modules/round/api/round_api.dart';
import 'package:apparence_kit/modules/round/domain/hole_score.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/domain/running_score.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundRepositoryProvider = Provider<RoundRepository>(
  (ref) => RoundRepository(
    roundApi: ref.read(roundApiProvider),
  ),
);

class RoundRepository {
  final RoundApi _roundApi;

  RoundRepository({required RoundApi roundApi}) : _roundApi = roundApi;

  /// Start a new round
  Future<Round> startRound({
    required String courseId,
    required String teeId,
    bool gpsEnabled = true,
    bool chatgptEnabled = true,
  }) async {
    final entity = await _roundApi.startRound(
      courseId: courseId,
      teeId: teeId,
      gpsEnabled: gpsEnabled,
      chatgptEnabled: chatgptEnabled,
    );
    return Round.fromEntity(entity);
  }

  /// Get round details with scores
  Future<Round> getRound(String roundId) async {
    final entity = await _roundApi.getRound(roundId);
    return Round.fromEntity(entity);
  }

  /// Update round settings
  Future<Round> updateRound(
    String roundId, {
    bool? gpsEnabled,
    bool? chatgptEnabled,
    String? notes,
  }) async {
    final entity = await _roundApi.updateRound(
      roundId,
      gpsEnabled: gpsEnabled,
      chatgptEnabled: chatgptEnabled,
      notes: notes,
    );
    return Round.fromEntity(entity);
  }

  /// Upsert a hole score
  /// Returns the updated score and running totals
  Future<ScoreUpdateResult> upsertScore({
    required String roundId,
    required int hole,
    int? strokes,
    int? putts,
    int? penalties,
    bool? fairwayHit,
    bool? gir,
  }) async {
    final response = await _roundApi.upsertScore(
      roundId: roundId,
      hole: hole,
      strokes: strokes,
      putts: putts,
      penalties: penalties,
      fairwayHit: fairwayHit,
      gir: gir,
    );

    final score = response.score;
    final running = response.running;

    return ScoreUpdateResult(
      holeNumber: score?.hole ?? hole,
      strokes: score?.strokes,
      putts: score?.putts,
      scoreName: score?.scoreName,
      running: running != null ? RunningScore.fromEntity(running) : null,
    );
  }

  /// Finish the active round
  Future<RoundSummary> finishRound({String? notes}) async {
    final response = await _roundApi.finishRound(notes: notes);
    if (response.summary != null) {
      return RoundSummary.fromEntity(response.summary!);
    }
    return const RoundSummary();
  }

  /// Get list of user's rounds
  Future<List<Round>> getRounds({
    String? status,
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _roundApi.getRounds(
      status: status,
      limit: limit,
      offset: offset,
    );
    return response.rounds.map(Round.fromEntity).toList();
  }
}

/// Result of a score upsert operation
class ScoreUpdateResult {
  final int holeNumber;
  final int? strokes;
  final int? putts;
  final String? scoreName;
  final RunningScore? running;

  const ScoreUpdateResult({
    required this.holeNumber,
    this.strokes,
    this.putts,
    this.scoreName,
    this.running,
  });
}
