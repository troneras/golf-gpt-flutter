import 'package:apparence_kit/modules/bag/domain/club.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_page_state.freezed.dart';

@freezed
sealed class BagPageState with _$BagPageState {
  const factory BagPageState({
    @Default([]) List<Club> clubs,
    @Default(false) bool isSaving,
  }) = BagPageStateData;

  const BagPageState._();
}
