import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rounds_page_state.freezed.dart';

@freezed
sealed class RoundsPageState with _$RoundsPageState {
  const factory RoundsPageState({
    @Default([]) List<Round> rounds,
    @Default(0) int total,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMore,
  }) = RoundsPageStateData;

  const RoundsPageState._();
}
