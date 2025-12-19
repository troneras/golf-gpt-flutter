import 'package:apparence_kit/modules/round/api/entities/hole_score_entity.dart';
import 'package:apparence_kit/modules/round/api/entities/round_entity.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/hole_score.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'round.freezed.dart';

@freezed
sealed class Round with _$Round {
  const factory Round({
    required String id,
    required String status,
    required DateTime startTime,
    DateTime? endTime,
    int? durationMinutes,
    int? totalStrokes,
    int? totalPutts,
    int? totalPenalties,
    int? scoreRelativeToPar,
    double? distanceWalked,
    int? fairwaysHit,
    int? fairwaysTotal,
    int? greensInRegulation,
    int? greensTotal,
    String? weatherConditions,
    @Default(false) bool chatgptEnabled,
    @Default(true) bool gpsEnabled,
    String? notes,
    required Course course,
    Tee? tee,
    @Default([]) List<HoleScore> scores,
  }) = RoundData;

  const Round._();

  factory Round.fromEntity(RoundEntity entity) {
    final course = entity.course != null
        ? Course.fromEntity(entity.course!)
        : Course(id: entity.courseId ?? '', name: 'Unknown');

    final tee = entity.tee != null ? Tee.fromEntity(entity.tee!) : null;

    // Get hole lengths from tee
    final holeLengths = tee?.holeLengths ?? [];

    // Build 18-hole scorecard with scores from API merged with course pars
    final scores = _buildScorecard(
      entity.scores,
      course.parsMen,
      holeLengths,
    );

    return Round(
      id: entity.id,
      status: entity.status,
      startTime: DateTime.parse(entity.startTime),
      endTime: entity.endTime != null ? DateTime.tryParse(entity.endTime!) : null,
      durationMinutes: entity.durationMinutes,
      totalStrokes: entity.totalStrokes,
      totalPutts: entity.totalPutts,
      totalPenalties: entity.totalPenalties,
      scoreRelativeToPar: entity.scoreRelativeToPar,
      distanceWalked: entity.distanceWalked,
      fairwaysHit: entity.fairwaysHit,
      fairwaysTotal: entity.fairwaysTotal,
      greensInRegulation: entity.greensInRegulation,
      greensTotal: entity.greensTotal,
      weatherConditions: entity.weatherConditions,
      chatgptEnabled: entity.chatgptEnabled,
      gpsEnabled: entity.gpsEnabled,
      notes: entity.notes,
      course: course,
      tee: tee,
      scores: scores,
    );
  }

  /// Build a full 18-hole scorecard from API scores + course data
  static List<HoleScore> _buildScorecard(
    List<dynamic> apiScores,
    List<int> parsMen,
    List<int> holeLengths,
  ) {
    final scoreMap = <int, dynamic>{};
    for (final score in apiScores) {
      // Handle HoleScoreEntity objects (from typed entity parsing)
      if (score is HoleScoreEntity) {
        scoreMap[score.holeNumber] = score;
      }
      // Handle raw JSON maps (fallback for untyped data)
      else if (score is Map<String, dynamic>) {
        final holeNumber = score['hole_number'] as int?;
        if (holeNumber != null) {
          scoreMap[holeNumber] = score;
        }
      }
    }

    return List.generate(18, (index) {
      final holeNumber = index + 1;
      final par = index < parsMen.length ? parsMen[index] : 4;
      final yards = index < holeLengths.length ? holeLengths[index] : null;

      final apiScore = scoreMap[holeNumber];
      if (apiScore != null) {
        // Handle HoleScoreEntity
        if (apiScore is HoleScoreEntity) {
          return HoleScore(
            id: apiScore.id,
            holeNumber: holeNumber,
            strokes: apiScore.strokes,
            putts: apiScore.putts,
            penalties: apiScore.penalties,
            par: apiScore.par ?? par,
            yards: yards,
            fairwayHit: apiScore.fairwayHit,
            greenInRegulation: apiScore.greenInRegulation,
            inSand: apiScore.inSand,
            scoreName: apiScore.scoreName,
          );
        }
        // Handle raw JSON map
        return HoleScore(
          id: apiScore['id'] as String?,
          holeNumber: holeNumber,
          strokes: apiScore['strokes'] as int?,
          putts: apiScore['putts'] as int?,
          penalties: apiScore['penalties'] as int?,
          par: (apiScore['par'] as int?) ?? par,
          yards: yards,
          fairwayHit: apiScore['fairway_hit'] as bool?,
          greenInRegulation: apiScore['green_in_regulation'] as bool?,
          inSand: apiScore['in_sand'] as bool?,
          scoreName: apiScore['score_name'] as String?,
        );
      }

      return HoleScore.empty(
        holeNumber: holeNumber,
        par: par,
        yards: yards,
      );
    });
  }

  /// Whether the round is currently active
  bool get isActive => status == 'active';

  /// Whether the round is finished
  bool get isFinished => status == 'finished';

  /// Number of holes completed
  int get holesPlayed => scores.where((s) => s.isPlayed).length;

  /// Current hole (first unplayed hole, or 18 if all completed)
  int get currentHole {
    for (int i = 0; i < scores.length; i++) {
      if (!scores[i].isPlayed) return i + 1;
    }
    return 18;
  }

  /// Front 9 scores (holes 1-9)
  List<HoleScore> get frontNine => scores.take(9).toList();

  /// Back 9 scores (holes 10-18)
  List<HoleScore> get backNine => scores.skip(9).take(9).toList();

  /// Front 9 total strokes
  int? get outStrokes {
    final played = frontNine.where((s) => s.isPlayed);
    if (played.isEmpty) return null;
    return played.fold<int>(0, (sum, s) => sum + (s.strokes ?? 0));
  }

  /// Front 9 total par
  int get outPar => frontNine.fold(0, (sum, s) => sum + s.par);

  /// Front 9 relative to par
  int? get outRelativeToPar {
    final strokes = outStrokes;
    if (strokes == null) return null;
    final playedPar = frontNine.where((s) => s.isPlayed).fold(0, (sum, s) => sum + s.par);
    return strokes - playedPar;
  }

  /// Front 9 total yards
  int? get outYards {
    if (frontNine.every((s) => s.yards == null)) return null;
    return frontNine.fold<int>(0, (sum, s) => sum + (s.yards ?? 0));
  }

  /// Back 9 total strokes
  int? get inStrokes {
    final played = backNine.where((s) => s.isPlayed);
    if (played.isEmpty) return null;
    return played.fold<int>(0, (sum, s) => sum + (s.strokes ?? 0));
  }

  /// Back 9 total par
  int get inPar => backNine.fold(0, (sum, s) => sum + s.par);

  /// Back 9 relative to par
  int? get inRelativeToPar {
    final strokes = inStrokes;
    if (strokes == null) return null;
    final playedPar = backNine.where((s) => s.isPlayed).fold(0, (sum, s) => sum + s.par);
    return strokes - playedPar;
  }

  /// Back 9 total yards
  int? get inYards {
    if (backNine.every((s) => s.yards == null)) return null;
    return backNine.fold<int>(0, (sum, s) => sum + (s.yards ?? 0));
  }

  /// Total yards for all 18 holes
  int? get totalYards {
    if (scores.every((s) => s.yards == null)) return null;
    return scores.fold<int>(0, (sum, s) => sum + (s.yards ?? 0));
  }

  /// Total par for all 18 holes
  int get totalPar => scores.fold(0, (sum, s) => sum + s.par);

  /// Current total strokes (computed from scores)
  int get computedTotalStrokes {
    return scores.where((s) => s.isPlayed).fold(0, (sum, s) => sum + (s.strokes ?? 0));
  }

  /// Current relative to par (computed from scores)
  int get computedRelativeToPar {
    final playedScores = scores.where((s) => s.isPlayed);
    final strokes = playedScores.fold(0, (sum, s) => sum + (s.strokes ?? 0));
    final par = playedScores.fold(0, (sum, s) => sum + s.par);
    return strokes - par;
  }

  /// Formatted relative to par (e.g., "-3", "E", "+5")
  String get relativeToParFormatted {
    final rel = computedRelativeToPar;
    if (holesPlayed == 0) return '-';
    if (rel == 0) return 'E';
    if (rel > 0) return '+$rel';
    return '$rel';
  }

  /// Get a copy with an updated score for a specific hole
  Round withUpdatedScore(HoleScore updatedScore) {
    final newScores = scores.map((s) {
      if (s.holeNumber == updatedScore.holeNumber) {
        return updatedScore;
      }
      return s;
    }).toList();

    return copyWith(scores: newScores);
  }
}
