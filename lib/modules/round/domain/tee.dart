import 'package:apparence_kit/modules/round/api/entities/tee_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tee.freezed.dart';

@freezed
sealed class Tee with _$Tee {
  const factory Tee({
    required String id,
    required String name,
    String? colorValue,
    int? slopeMen,
    int? slopeWomen,
    double? courseRatingMen,
    double? courseRatingWomen,
    int? totalLength,
    @Default('yards') String measureUnit,
    @Default([]) List<int> holeLengths,
  }) = TeeData;

  const Tee._();

  factory Tee.fromEntity(TeeEntity entity) {
    return Tee(
      id: entity.id,
      name: entity.name,
      colorValue: entity.color,
      slopeMen: entity.slopeMen,
      slopeWomen: entity.slopeWomen,
      courseRatingMen: entity.courseRatingMen,
      courseRatingWomen: entity.courseRatingWomen,
      totalLength: entity.totalLength,
      measureUnit: entity.measureUnit ?? 'yards',
      holeLengths: entity.holeLengths ?? [],
    );
  }

  Color get displayColor {
    if (colorValue == null) return const Color(0xFF9E9E9E);

    // Handle hex color codes like #ed0000
    if (colorValue!.startsWith('#')) {
      try {
        final hex = colorValue!.replaceFirst('#', '');
        if (hex.length == 6) {
          return Color(int.parse('FF$hex', radix: 16));
        }
        if (hex.length == 8) {
          return Color(int.parse(hex, radix: 16));
        }
      } catch (_) {
        // Fall through to name-based matching
      }
    }

    // Fallback to name-based matching
    switch (colorValue!.toLowerCase()) {
      case 'red':
      case 'rojas':
        return const Color(0xFFE53935);
      case 'green':
      case 'verdes':
        return const Color(0xFF43A047);
      case 'white':
      case 'blancas':
        return const Color(0xFF9E9E9E);
      case 'yellow':
      case 'amarillas':
        return const Color(0xFFFDD835);
      case 'blue':
      case 'azules':
        return const Color(0xFF1E88E5);
      case 'black':
      case 'negras':
        return const Color(0xFF212121);
      case 'gold':
      case 'doradas':
        return const Color(0xFFFFB300);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  bool get isLightColor {
    final color = displayColor;
    // Calculate luminance to determine if color is light
    return color.computeLuminance() > 0.5;
  }

  String get formattedLength {
    if (totalLength == null) return '';
    final unit = (measureUnit == 'm' || measureUnit == 'meters') ? 'm' : 'yds';
    return '$totalLength $unit';
  }
}
