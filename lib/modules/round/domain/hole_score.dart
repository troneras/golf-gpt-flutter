import 'package:apparence_kit/modules/round/api/entities/hole_score_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hole_score.freezed.dart';

@freezed
sealed class HoleScore with _$HoleScore {
  const factory HoleScore({
    String? id,
    required int holeNumber,
    int? strokes,
    int? putts,
    int? penalties,
    required int par,
    int? yards,
    bool? fairwayHit,
    bool? greenInRegulation,
    bool? inSand,
    String? scoreName,
  }) = HoleScoreData;

  const HoleScore._();

  factory HoleScore.fromEntity(HoleScoreEntity entity, {int? par, int? yards}) {
    return HoleScore(
      id: entity.id,
      holeNumber: entity.holeNumber,
      strokes: entity.strokes,
      putts: entity.putts,
      penalties: entity.penalties,
      par: entity.par ?? par ?? 4,
      yards: yards,
      fairwayHit: entity.fairwayHit,
      greenInRegulation: entity.greenInRegulation,
      inSand: entity.inSand,
      scoreName: entity.scoreName,
    );
  }

  /// Create an empty score for a hole (not yet played)
  factory HoleScore.empty({
    required int holeNumber,
    required int par,
    int? yards,
  }) {
    return HoleScore(
      holeNumber: holeNumber,
      par: par,
      yards: yards,
    );
  }

  /// Whether this hole has been scored
  bool get isPlayed => strokes != null;

  /// Score relative to par for this hole
  int? get relativeToPar {
    if (strokes == null) return null;
    return strokes! - par;
  }

  /// Formatted score relative to par (e.g., "-1", "E", "+2")
  String get relativeToParFormatted {
    final rel = relativeToPar;
    if (rel == null) return '-';
    if (rel == 0) return 'E';
    if (rel > 0) return '+$rel';
    return '$rel';
  }

  /// Score name (computed if not provided by server)
  String get displayScoreName {
    if (scoreName != null) return scoreName!;
    final rel = relativeToPar;
    if (rel == null) return '';
    return switch (rel) {
      <= -3 => 'Albatross',
      -2 => 'Eagle',
      -1 => 'Birdie',
      0 => 'Par',
      1 => 'Bogey',
      2 => 'Double',
      3 => 'Triple',
      _ => '+${rel}',
    };
  }
}
