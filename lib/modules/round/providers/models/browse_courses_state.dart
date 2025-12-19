import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'browse_courses_state.freezed.dart';

enum BrowseCoursesTab { nearby, recent, search }

@freezed
sealed class BrowseCoursesState with _$BrowseCoursesState {
  const factory BrowseCoursesState({
    @Default(BrowseCoursesTab.nearby) BrowseCoursesTab currentTab,
    @Default([]) List<Course> nearbyCourses,
    @Default([]) List<Course> recentCourses,
    @Default([]) List<Course> searchResults,
    @Default('') String searchQuery,
    @Default(false) bool isLoadingNearby,
    @Default(false) bool isLoadingRecent,
    @Default(false) bool isLoadingSearch,
    String? nearbyError,
    String? recentError,
    String? searchError,
  }) = BrowseCoursesStateData;

  const BrowseCoursesState._();

  List<Course> get currentCourses => switch (currentTab) {
        BrowseCoursesTab.nearby => nearbyCourses,
        BrowseCoursesTab.recent => recentCourses,
        BrowseCoursesTab.search => searchResults,
      };

  bool get isLoading => switch (currentTab) {
        BrowseCoursesTab.nearby => isLoadingNearby,
        BrowseCoursesTab.recent => isLoadingRecent,
        BrowseCoursesTab.search => isLoadingSearch,
      };

  String? get currentError => switch (currentTab) {
        BrowseCoursesTab.nearby => nearbyError,
        BrowseCoursesTab.recent => recentError,
        BrowseCoursesTab.search => searchError,
      };
}
