import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/repositories/round_repository.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_round_notifier.g.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

/// Provider for managing the active round state.
/// keepAlive: true ensures the state persists across navigation.
@Riverpod(keepAlive: true)
class ActiveRoundNotifier extends _$ActiveRoundNotifier {
  RoundRepository get _roundRepository => ref.read(roundRepositoryProvider);

  @override
  ActiveRoundState build() {
    return const ActiveRoundState.initial();
  }

  /// Start a new round
  Future<void> startRound({
    required String courseId,
    required String teeId,
    bool gpsEnabled = true,
  }) async {
    _logger.i('Starting round: courseId=$courseId, teeId=$teeId, gps=$gpsEnabled');
    state = const ActiveRoundState.loading();

    try {
      final round = await _roundRepository.startRound(
        courseId: courseId,
        teeId: teeId,
        gpsEnabled: gpsEnabled,
        chatgptEnabled: true,
      );
      if (!ref.mounted) return;
      _logger.i('Round started: ${round.id} at ${round.course.name}');
      state = ActiveRoundState.active(
        round: round,
        currentHole: round.currentHole,
      );
    } catch (e, stackTrace) {
      _logger.e('Error starting round', error: e, stackTrace: stackTrace);
      if (!ref.mounted) return;
      state = ActiveRoundState.error(message: e.toString());
    }
  }

  /// Load an existing round by ID
  Future<void> loadRound(String roundId) async {
    _logger.i('Loading round: $roundId');
    state = const ActiveRoundState.loading();

    try {
      final round = await _roundRepository.getRound(roundId);
      if (!ref.mounted) return;
      _logger.i('Round loaded: ${round.id}, status=${round.status}');

      if (round.isFinished) {
        // Round is already finished, we need to show summary
        state = ActiveRoundState.error(
          message: 'Round is already finished',
          roundId: roundId,
        );
        return;
      }

      state = ActiveRoundState.active(
        round: round,
        currentHole: round.currentHole,
      );
    } catch (e, stackTrace) {
      _logger.e('Error loading round', error: e, stackTrace: stackTrace);
      if (!ref.mounted) return;
      state = ActiveRoundState.error(message: e.toString(), roundId: roundId);
    }
  }

  /// Refresh the current round (pull-to-refresh)
  Future<void> refresh() async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) {
      _logger.w('Cannot refresh: no active round');
      return;
    }

    _logger.i('Refreshing round: ${currentState.round.id}');

    try {
      final round = await _roundRepository.getRound(currentState.round.id);
      if (!ref.mounted) return;
      _logger.i('Round refreshed: ${round.holesPlayed} holes played');
      state = ActiveRoundState.active(
        round: round,
        currentHole: round.currentHole,
      );
    } catch (e, stackTrace) {
      _logger.e('Error refreshing round', error: e, stackTrace: stackTrace);
      // Don't change state on refresh error, just log it
    }
  }

  /// Update a hole score
  Future<void> updateScore({
    required int hole,
    int? strokes,
    int? putts,
    int? penalties,
  }) async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) {
      _logger.w('Cannot update score: no active round');
      return;
    }

    _logger.i('Updating score: hole=$hole, strokes=$strokes, putts=$putts');

    // Optimistic update
    final updatedScore = currentState.round.scores[hole - 1].copyWith(
      strokes: strokes,
      putts: putts,
      penalties: penalties,
    );
    final updatedRound = currentState.round.withUpdatedScore(updatedScore);
    state = currentState.copyWith(
      round: updatedRound,
      isSaving: true,
      savingError: null,
    );

    try {
      final result = await _roundRepository.upsertScore(
        roundId: currentState.round.id,
        hole: hole,
        strokes: strokes,
        putts: putts,
        penalties: penalties,
      );
      if (!ref.mounted) return;
      _logger.i('Score saved: hole=$hole, scoreName=${result.scoreName}');

      // Update with server response
      final serverScore = updatedScore.copyWith(
        scoreName: result.scoreName,
      );
      final finalRound = updatedRound.withUpdatedScore(serverScore);

      // Calculate next current hole
      int newCurrentHole = currentState.currentHole;
      if (hole == currentState.currentHole && strokes != null) {
        // Move to next hole if current hole was scored
        newCurrentHole = (hole < 18) ? hole + 1 : 18;
      }

      state = ActiveRoundStateActive(
        round: finalRound,
        currentHole: newCurrentHole,
        isSaving: false,
      );
    } catch (e, stackTrace) {
      _logger.e('Error saving score', error: e, stackTrace: stackTrace);
      if (!ref.mounted) return;
      state = currentState.copyWith(
        isSaving: false,
        savingError: e.toString(),
      );
    }
  }

  /// Increment strokes for a hole
  Future<void> incrementStrokes(int hole) async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) return;

    final currentScore = currentState.round.scores[hole - 1];
    final newStrokes = (currentScore.strokes ?? currentScore.par) + 1;

    await updateScore(
      hole: hole,
      strokes: newStrokes,
      putts: currentScore.putts,
      penalties: currentScore.penalties,
    );
  }

  /// Decrement strokes for a hole
  Future<void> decrementStrokes(int hole) async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) return;

    final currentScore = currentState.round.scores[hole - 1];
    final currentStrokes = currentScore.strokes ?? currentScore.par;
    if (currentStrokes <= 1) return; // Can't go below 1

    await updateScore(
      hole: hole,
      strokes: currentStrokes - 1,
      putts: currentScore.putts,
      penalties: currentScore.penalties,
    );
  }

  /// Set GPS enabled/disabled for the round
  Future<void> setGpsEnabled(bool enabled) async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) {
      _logger.w('Cannot toggle GPS: no active round');
      return;
    }

    _logger.i('Setting GPS enabled: $enabled');

    try {
      final updatedRound = await _roundRepository.updateRound(
        currentState.round.id,
        gpsEnabled: enabled,
      );
      if (!ref.mounted) return;
      state = currentState.copyWith(
        round: updatedRound,
      );
      _logger.i('GPS setting updated');
    } catch (e, stackTrace) {
      _logger.e('Error updating GPS setting', error: e, stackTrace: stackTrace);
    }
  }

  /// Finish the current round
  Future<void> finishRound({String? notes}) async {
    final currentState = state;
    if (currentState is! ActiveRoundStateActive) {
      _logger.w('Cannot finish: no active round');
      return;
    }

    _logger.i('Finishing round: ${currentState.round.id}');
    state = currentState.copyWith(isSaving: true);

    try {
      final summary = await _roundRepository.finishRound(notes: notes);
      if (!ref.mounted) return;
      _logger.i('Round finished: ${summary.totalStrokes} strokes');
      state = ActiveRoundState.finished(
        roundId: currentState.round.id,
        summary: summary,
      );
    } catch (e, stackTrace) {
      _logger.e('Error finishing round', error: e, stackTrace: stackTrace);
      if (!ref.mounted) return;
      state = currentState.copyWith(
        isSaving: false,
        savingError: e.toString(),
      );
    }
  }

  /// Clear the current round state
  void clear() {
    state = const ActiveRoundState.initial();
  }
}
