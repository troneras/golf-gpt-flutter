import 'package:apparence_kit/modules/bag/providers/models/bag_page_state.dart';
import 'package:apparence_kit/modules/bag/repositories/bag_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bag_page_notifier.g.dart';

@riverpod
class BagPageNotifier extends _$BagPageNotifier {
  @override
  FutureOr<BagPageState> build() async {
    return _loadClubs();
  }

  Future<BagPageState> _loadClubs() async {
    final repository = ref.read(bagRepositoryProvider);
    final clubs = await repository.getClubs();
    return BagPageState(clubs: clubs);
  }

  Future<void> addClub({
    required String clubType,
    int? distanceYards,
  }) async {
    if (!state.hasValue) return;
    final currentState = state.value!;
    state = AsyncData(currentState.copyWith(isSaving: true));
    try {
      final repository = ref.read(bagRepositoryProvider);
      final newClub = await repository.addClub(
        clubType: clubType,
        distanceYards: distanceYards,
      );
      final updatedClubs = [...currentState.clubs, newClub];
      state = AsyncData(BagPageState(clubs: updatedClubs));
    } catch (e) {
      state = AsyncData(currentState.copyWith(isSaving: false));
      rethrow;
    }
  }

  Future<void> updateClubDistance({
    required String clubId,
    required int distanceYards,
  }) async {
    if (!state.hasValue) return;
    final currentState = state.value!;
    state = AsyncData(currentState.copyWith(isSaving: true));
    try {
      final repository = ref.read(bagRepositoryProvider);
      final updatedClub = await repository.updateDistance(
        clubId: clubId,
        distanceYards: distanceYards,
      );
      final updatedClubs = currentState.clubs.map((club) {
        if (club.id == clubId) {
          return updatedClub;
        }
        return club;
      }).toList();
      state = AsyncData(BagPageState(clubs: updatedClubs));
    } catch (e) {
      state = AsyncData(currentState.copyWith(isSaving: false));
      rethrow;
    }
  }

  Future<void> deleteClub(String clubId) async {
    if (!state.hasValue) return;
    final currentState = state.value!;
    state = AsyncData(currentState.copyWith(isSaving: true));
    try {
      final repository = ref.read(bagRepositoryProvider);
      await repository.deleteClub(clubId);
      final updatedClubs = currentState.clubs
          .where((club) => club.id != clubId)
          .toList();
      state = AsyncData(BagPageState(clubs: updatedClubs));
    } catch (e) {
      state = AsyncData(currentState.copyWith(isSaving: false));
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadClubs());
  }
}
