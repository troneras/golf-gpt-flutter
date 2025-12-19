import 'package:apparence_kit/modules/bag/api/bag_api.dart';
import 'package:apparence_kit/modules/bag/domain/club.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bagRepositoryProvider = Provider<BagRepository>(
  (ref) => BagRepository(
    bagApi: ref.read(bagApiProvider),
  ),
);

class BagRepository {
  final BagApi _bagApi;

  BagRepository({required BagApi bagApi}) : _bagApi = bagApi;

  /// Get all clubs in the user's bag
  Future<List<Club>> getClubs() async {
    final entities = await _bagApi.getClubs();
    return entities.map(Club.fromEntity).toList();
  }

  /// Add a new club to the bag
  Future<Club> addClub({
    required String clubType,
    int? distanceYards,
  }) async {
    final entity = await _bagApi.addClub(
      clubType: clubType,
      distanceYards: distanceYards,
    );
    return Club.fromEntity(entity);
  }

  /// Update the distance for a club
  Future<Club> updateDistance({
    required String clubId,
    required int distanceYards,
  }) async {
    final entity = await _bagApi.recordDistance(
      clubId: clubId,
      distanceYards: distanceYards,
    );
    return Club.fromEntity(entity);
  }

  /// Delete a club from the bag
  Future<void> deleteClub(String clubId) async {
    await _bagApi.deleteClub(clubId, permanent: true);
  }
}
