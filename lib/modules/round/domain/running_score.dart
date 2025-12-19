import 'package:apparence_kit/modules/round/api/entities/score_upsert_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'running_score.freezed.dart';

@freezed
sealed class RunningScore with _$RunningScore {
  const factory RunningScore({
    @Default(0) int totalStrokes,
    @Default(0) int holesPlayed,
    @Default(0) int relativeToPar,
    @Default(0) int totalPar,
  }) = RunningScoreData;

  const RunningScore._();

  factory RunningScore.fromEntity(RunningScoreEntity entity) {
    return RunningScore(
      totalStrokes: entity.totalStrokes ?? 0,
      holesPlayed: entity.holesPlayed ?? 0,
      relativeToPar: entity.relativeToPar ?? 0,
    );
  }

  /// Formatted score relative to par (e.g., "-3", "E", "+5")
  String get relativeToParFormatted {
    if (holesPlayed == 0) return '-';
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  /// Summary text (e.g., "42 (+6)")
  String get summaryText {
    if (holesPlayed == 0) return '-';
    return '$totalStrokes ($relativeToParFormatted)';
  }
}

/// Summary of a finished round
@freezed
sealed class RoundSummary with _$RoundSummary {
  const factory RoundSummary({
    @Default(0) int totalStrokes,
    @Default(0) int relativeToPar,
    @Default(0) int totalPutts,
    int? fairwaysHit,
    int? fairwaysTotal,
    int? gir,
    int? girTotal,
    int? durationMinutes,
  }) = RoundSummaryData;

  const RoundSummary._();

  factory RoundSummary.fromEntity(RoundSummaryEntity entity) {
    return RoundSummary(
      totalStrokes: entity.totalStrokes ?? 0,
      relativeToPar: entity.relativeToPar ?? 0,
      totalPutts: entity.totalPutts ?? 0,
      fairwaysHit: entity.fairwaysHit,
      fairwaysTotal: entity.fairwaysTotal,
      gir: entity.gir,
      girTotal: entity.girTotal,
      durationMinutes: entity.durationMinutes,
    );
  }

  /// Formatted score relative to par
  String get relativeToParFormatted {
    if (relativeToPar == 0) return 'E';
    if (relativeToPar > 0) return '+$relativeToPar';
    return '$relativeToPar';
  }

  /// Fairways hit formatted (e.g., "8/14")
  String get fairwaysFormatted {
    if (fairwaysHit == null || fairwaysTotal == null) return '-';
    return '$fairwaysHit/$fairwaysTotal';
  }

  /// Fairways percentage
  double? get fairwaysPercentage {
    if (fairwaysHit == null || fairwaysTotal == null || fairwaysTotal == 0) return null;
    return fairwaysHit! / fairwaysTotal!;
  }

  /// GIR formatted (e.g., "6/18")
  String get girFormatted {
    if (gir == null || girTotal == null) return '-';
    return '$gir/$girTotal';
  }

  /// GIR percentage
  double? get girPercentage {
    if (gir == null || girTotal == null || girTotal == 0) return null;
    return gir! / girTotal!;
  }

  /// Duration formatted (e.g., "3h 42m")
  String get durationFormatted {
    if (durationMinutes == null) return '-';
    final hours = durationMinutes! ~/ 60;
    final minutes = durationMinutes! % 60;
    if (hours == 0) return '${minutes}m';
    return '${hours}h ${minutes}m';
  }
}
