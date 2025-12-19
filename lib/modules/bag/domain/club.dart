import 'package:apparence_kit/modules/bag/api/entities/club_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';

@freezed
sealed class Club with _$Club {
  const factory Club({
    required String id,
    required String clubType,
    required String displayName,
    int? distanceYards,
    required bool isActive,
  }) = ClubData;

  const Club._();

  factory Club.fromEntity(ClubEntity entity) {
    return Club(
      id: entity.id,
      clubType: entity.clubType,
      displayName: entity.displayName,
      distanceYards: entity.currentDistanceYards,
      isActive: entity.isActive,
    );
  }

  String get distanceFormatted {
    if (distanceYards == null) return '—';
    return '$distanceYards yds';
  }
}

/// Valid club types for the dropdown
class ClubTypes {
  static const List<ClubTypeOption> all = [
    ClubTypeOption('driver', 'Driver'),
    ClubTypeOption('3_wood', '3 Wood'),
    ClubTypeOption('5_wood', '5 Wood'),
    ClubTypeOption('7_wood', '7 Wood'),
    ClubTypeOption('2_hybrid', '2 Hybrid'),
    ClubTypeOption('3_hybrid', '3 Hybrid'),
    ClubTypeOption('4_hybrid', '4 Hybrid'),
    ClubTypeOption('5_hybrid', '5 Hybrid'),
    ClubTypeOption('6_hybrid', '6 Hybrid'),
    ClubTypeOption('1_iron', '1 Iron'),
    ClubTypeOption('2_iron', '2 Iron'),
    ClubTypeOption('3_iron', '3 Iron'),
    ClubTypeOption('4_iron', '4 Iron'),
    ClubTypeOption('5_iron', '5 Iron'),
    ClubTypeOption('6_iron', '6 Iron'),
    ClubTypeOption('7_iron', '7 Iron'),
    ClubTypeOption('8_iron', '8 Iron'),
    ClubTypeOption('9_iron', '9 Iron'),
    ClubTypeOption('pw', 'Pitching Wedge'),
    ClubTypeOption('gw', 'Gap Wedge'),
    ClubTypeOption('sw', 'Sand Wedge'),
    ClubTypeOption('lw', 'Lob Wedge'),
    ClubTypeOption('putter', 'Putter'),
  ];

  static String getDisplayName(String clubType) {
    return all
        .firstWhere(
          (c) => c.type == clubType,
          orElse: () => ClubTypeOption(clubType, clubType),
        )
        .displayName;
  }
}

class ClubTypeOption {
  final String type;
  final String displayName;

  const ClubTypeOption(this.type, this.displayName);
}
