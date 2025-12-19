import 'package:apparence_kit/modules/round/api/entities/course_entity.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';

@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String name,
    String? clubName,
    String? externalCourseId,
    String? address,
    String? city,
    String? state,
    String? country,
    double? latitude,
    double? longitude,
    double? distanceKm,
    @Default([]) List<Tee> tees,
    int? holes,
    int? par,
    String? measureUnit,
    bool? hasGps,
    @Default([]) List<int> parsMen,
    @Default([]) List<int> indexesMen,
  }) = CourseData;

  const Course._();

  factory Course.fromEntity(CourseEntity entity) {
    return Course(
      id: entity.id,
      name: entity.name,
      clubName: entity.clubName,
      externalCourseId: entity.externalCourseId,
      address: entity.address,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      latitude: entity.latitude,
      longitude: entity.longitude,
      distanceKm: entity.distanceKm,
      tees: entity.tees.map(Tee.fromEntity).toList(),
      holes: entity.holes,
      par: entity.par,
      measureUnit: entity.measureUnit,
      hasGps: entity.hasGps,
      parsMen: entity.parsMen ?? [],
      indexesMen: entity.indexesMen ?? [],
    );
  }

  String get formattedLocation {
    final parts = <String>[];
    if (city != null && city!.isNotEmpty) parts.add(city!);
    if (state != null && state!.isNotEmpty) parts.add(state!);
    if (country != null && country!.isNotEmpty) parts.add(country!);
    return parts.join(', ');
  }

  String get formattedDistance {
    if (distanceKm == null) return '';
    if (distanceKm! < 1) {
      return '${(distanceKm! * 1000).round()} m';
    }
    return '${distanceKm!.toStringAsFixed(1)} km';
  }

  String get cityCountry {
    final parts = <String>[];
    if (city != null && city!.isNotEmpty) parts.add(city!);
    if (country != null && country!.isNotEmpty) parts.add(country!);
    return parts.join(', ');
  }
}
