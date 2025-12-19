import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/browse_courses_state.dart';
import 'package:apparence_kit/modules/round/repositories/course_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'browse_courses_notifier.g.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

@riverpod
class BrowseCoursesNotifier extends _$BrowseCoursesNotifier {
  CourseRepository get _courseRepository => ref.read(courseRepositoryProvider);
  Position? _cachedPosition;

  @override
  BrowseCoursesState build() {
    // Defer loading to after build() completes
    Future.microtask(() => _loadNearbyCourses());
    return const BrowseCoursesState(isLoadingNearby: true);
  }

  void setTab(BrowseCoursesTab tab) {
    state = state.copyWith(currentTab: tab);
    switch (tab) {
      case BrowseCoursesTab.nearby:
        if (state.nearbyCourses.isEmpty && !state.isLoadingNearby && state.nearbyError == null) {
          _loadNearbyCourses();
        }
      case BrowseCoursesTab.recent:
        if (state.recentCourses.isEmpty && !state.isLoadingRecent && state.recentError == null) {
          _loadRecentCourses();
        }
      case BrowseCoursesTab.search:
        break;
    }
  }

  Future<void> _loadNearbyCourses() async {
    _logger.i('Loading nearby courses...');
    state = state.copyWith(isLoadingNearby: true, nearbyError: null);
    try {
      if (_cachedPosition == null) {
        // Try last known position first (instant)
        _logger.i('Checking last known position...');
        _cachedPosition = await Geolocator.getLastKnownPosition();
        if (_cachedPosition == null) {
          // Fall back to getting current position with timeout
          _logger.i('Getting current GPS position...');
          _cachedPosition = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.medium,
              timeLimit: Duration(seconds: 10),
            ),
          );
        }
      }
      _logger.i('GPS position: lat=${_cachedPosition!.latitude}, lng=${_cachedPosition!.longitude}');
      _logger.i('Fetching nearby courses from API...');
      final courses = await _courseRepository.getNearby(
        latitude: _cachedPosition!.latitude,
        longitude: _cachedPosition!.longitude,
      );
      _logger.i('Loaded ${courses.length} nearby courses');
      state = state.copyWith(
        nearbyCourses: courses,
        isLoadingNearby: false,
      );
    } catch (e, stackTrace) {
      _logger.e('Error loading nearby courses', error: e, stackTrace: stackTrace);
      state = state.copyWith(
        isLoadingNearby: false,
        nearbyError: e.toString(),
      );
    }
  }

  Future<void> _loadRecentCourses() async {
    final userState = ref.read(userStateNotifierProvider);
    if (!userState.user.isAuthenticated) {
      _logger.w('User not authenticated, cannot load recent courses');
      state = state.copyWith(
        isLoadingRecent: false,
        recentError: 'authentication_required',
      );
      return;
    }
    state = state.copyWith(isLoadingRecent: true, recentError: null);
    try {
      final courses = await _courseRepository.getRecent();
      _logger.i('Loaded ${courses.length} recent courses');
      state = state.copyWith(
        recentCourses: courses,
        isLoadingRecent: false,
      );
    } catch (e, stackTrace) {
      _logger.e('Error loading recent courses', error: e, stackTrace: stackTrace);
      state = state.copyWith(
        isLoadingRecent: false,
        recentError: e.toString(),
      );
    }
  }

  Future<void> search(String query) async {
    state = state.copyWith(searchQuery: query);
    if (query.length < 3) {
      state = state.copyWith(searchResults: [], isLoadingSearch: false, searchError: null);
      return;
    }
    state = state.copyWith(isLoadingSearch: true, searchError: null);
    try {
      final courses = await _courseRepository.search(query);
      if (state.searchQuery == query) {
        _logger.i('Search returned ${courses.length} courses for query: $query');
        state = state.copyWith(
          searchResults: courses,
          isLoadingSearch: false,
        );
      }
    } catch (e, stackTrace) {
      if (state.searchQuery == query) {
        _logger.e('Error searching courses', error: e, stackTrace: stackTrace);
        state = state.copyWith(
          isLoadingSearch: false,
          searchError: e.toString(),
        );
      }
    }
  }

  void retry() {
    switch (state.currentTab) {
      case BrowseCoursesTab.nearby:
        _loadNearbyCourses();
      case BrowseCoursesTab.recent:
        _loadRecentCourses();
      case BrowseCoursesTab.search:
        search(state.searchQuery);
    }
  }
}
