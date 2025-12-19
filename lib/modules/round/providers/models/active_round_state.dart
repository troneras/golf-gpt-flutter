import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/domain/running_score.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_round_state.freezed.dart';

@freezed
sealed class ActiveRoundState with _$ActiveRoundState {
  /// Initial state before any round is loaded
  const factory ActiveRoundState.initial() = ActiveRoundStateInitial;

  /// Loading a round
  const factory ActiveRoundState.loading() = ActiveRoundStateLoading;

  /// Round is in progress
  const factory ActiveRoundState.active({
    required Round round,
    required int currentHole,
    @Default(false) bool isSaving,
    String? savingError,
  }) = ActiveRoundStateActive;

  /// Round has been finished
  const factory ActiveRoundState.finished({
    required String roundId,
    required RoundSummary summary,
  }) = ActiveRoundStateFinished;

  /// Error state
  const factory ActiveRoundState.error({
    required String message,
    String? roundId,
  }) = ActiveRoundStateError;

  const ActiveRoundState._();
}
