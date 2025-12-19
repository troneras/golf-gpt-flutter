import 'package:apparence_kit/modules/round/api/round_api.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/rounds/providers/models/rounds_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rounds_page_notifier.g.dart';

@riverpod
class RoundsPageNotifier extends _$RoundsPageNotifier {
  static const int _pageSize = 20;

  @override
  FutureOr<RoundsPageState> build() async {
    return _loadRounds(offset: 0);
  }

  Future<RoundsPageState> _loadRounds({required int offset}) async {
    final api = ref.read(roundApiProvider);
    final response = await api.getRounds(
      status: 'finished',
      limit: _pageSize,
      offset: offset,
    );
    final rounds = response.rounds.map((e) => Round.fromEntity(e)).toList();
    return RoundsPageState(
      rounds: rounds,
      total: response.total,
      hasMore: rounds.length < response.total,
    );
  }

  Future<void> loadMore() async {
    if (!state.hasValue) return;
    final currentState = state.value!;
    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }
    state = AsyncData(currentState.copyWith(isLoadingMore: true));
    try {
      final api = ref.read(roundApiProvider);
      final response = await api.getRounds(
        status: 'finished',
        limit: _pageSize,
        offset: currentState.rounds.length,
      );
      final newRounds = response.rounds.map((e) => Round.fromEntity(e)).toList();
      final allRounds = [...currentState.rounds, ...newRounds];
      state = AsyncData(currentState.copyWith(
        rounds: allRounds,
        isLoadingMore: false,
        hasMore: allRounds.length < response.total,
      ));
    } catch (e) {
      state = AsyncData(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadRounds(offset: 0));
  }
}
