import 'dart:async';

import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/providers/browse_courses_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/browse_courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BrowseCoursesPage extends ConsumerStatefulWidget {
  const BrowseCoursesPage({super.key});

  @override
  ConsumerState<BrowseCoursesPage> createState() => _BrowseCoursesPageState();
}

class _BrowseCoursesPageState extends ConsumerState<BrowseCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final tab = BrowseCoursesTab.values[_tabController.index];
      ref.read(browseCoursesProvider.notifier).setTab(tab);
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      ref.read(browseCoursesProvider.notifier).search(query);
    });
  }

  void _onCourseSelected(Course course) {
    context.pop(course);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(browseCoursesProvider);
    final tr = Translations.of(context).browse_courses;
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colors.onBackground),
          onPressed: () => context.pop(),
        ),
        title: Text(
          tr.title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: context.colors.onBackground,
          unselectedLabelColor: context.colors.onBackground.withValues(alpha: 0.5),
          indicatorColor: context.colors.primary,
          tabs: [
            Tab(text: tr.tab_nearby),
            Tab(text: tr.tab_recent),
            Tab(text: tr.tab_search),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _NearbyTab(
            state: state,
            onCourseSelected: _onCourseSelected,
            onRetry: () => ref.read(browseCoursesProvider.notifier).retry(),
          ),
          _RecentTab(
            state: state,
            onCourseSelected: _onCourseSelected,
            onRetry: () => ref.read(browseCoursesProvider.notifier).retry(),
            onLogin: () => context.go('/signin'),
          ),
          _SearchTab(
            state: state,
            onCourseSelected: _onCourseSelected,
            onSearchChanged: _onSearchChanged,
            onRetry: () => ref.read(browseCoursesProvider.notifier).retry(),
          ),
        ],
      ),
    );
  }
}

class _NearbyTab extends StatelessWidget {
  final BrowseCoursesState state;
  final void Function(Course) onCourseSelected;
  final VoidCallback onRetry;

  const _NearbyTab({
    required this.state,
    required this.onCourseSelected,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).browse_courses;
    if (state.isLoadingNearby) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.nearbyError != null) {
      return _ErrorView(
        message: tr.error_loading,
        onRetry: onRetry,
      );
    }
    if (state.nearbyCourses.isEmpty) {
      return _EmptyView(
        message: tr.empty_nearby,
      );
    }
    return _CourseListView(
      courses: state.nearbyCourses,
      onCourseSelected: onCourseSelected,
    );
  }
}

class _RecentTab extends StatelessWidget {
  final BrowseCoursesState state;
  final void Function(Course) onCourseSelected;
  final VoidCallback onRetry;
  final VoidCallback onLogin;

  const _RecentTab({
    required this.state,
    required this.onCourseSelected,
    required this.onRetry,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).browse_courses;
    if (state.isLoadingRecent) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.recentError == 'authentication_required') {
      return _LoginRequiredView(
        message: tr.login_required,
        actionLabel: tr.login_action,
        onLogin: onLogin,
      );
    }
    if (state.recentError != null) {
      return _ErrorView(
        message: tr.error_loading,
        onRetry: onRetry,
      );
    }
    if (state.recentCourses.isEmpty) {
      return _EmptyView(
        message: tr.empty_recent,
        hint: tr.empty_recent_hint,
      );
    }
    return _CourseListView(
      courses: state.recentCourses,
      onCourseSelected: onCourseSelected,
    );
  }
}

class _SearchTab extends StatelessWidget {
  final BrowseCoursesState state;
  final void Function(Course) onCourseSelected;
  final void Function(String) onSearchChanged;
  final VoidCallback onRetry;

  const _SearchTab({
    required this.state,
    required this.onCourseSelected,
    required this.onSearchChanged,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).browse_courses;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: tr.search_placeholder,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.colors.onSurface.withValues(alpha: 0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.colors.onSurface.withValues(alpha: 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colors.primary),
              ),
              filled: true,
              fillColor: context.colors.surface,
            ),
          ),
        ),
        Expanded(child: _buildContent(context, tr)),
      ],
    );
  }

  Widget _buildContent(BuildContext context, TranslationsBrowseCoursesEs tr) {
    if (state.isLoadingSearch) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.searchError != null) {
      return _ErrorView(
        message: tr.error_loading,
        onRetry: onRetry,
      );
    }
    if (state.searchQuery.length < 3) {
      return _EmptyView(
        message: tr.search_min_chars,
        icon: Icons.search,
      );
    }
    if (state.searchResults.isEmpty) {
      return _EmptyView(
        message: tr.no_results,
      );
    }
    return _CourseListView(
      courses: state.searchResults,
      onCourseSelected: onCourseSelected,
    );
  }
}

class _CourseListView extends StatelessWidget {
  final List<Course> courses;
  final void Function(Course) onCourseSelected;

  const _CourseListView({
    required this.courses,
    required this.onCourseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return _CourseListTile(
          course: course,
          onTap: () => onCourseSelected(course),
        );
      },
    );
  }
}

class _CourseListTile extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const _CourseListTile({
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/icons/ic_flag.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (course.formattedDistance.isNotEmpty)
                      Text(
                        course.formattedDistance,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: context.colors.onSurface.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  final String message;
  final String? hint;
  final IconData? icon;

  const _EmptyView({
    required this.message,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.golf_course,
              size: 64,
              color: context.colors.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            if (hint != null) ...[
              const SizedBox(height: 8),
              Text(
                hint!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.4),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).browse_courses;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: onRetry,
              child: Text(tr.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginRequiredView extends StatelessWidget {
  final String message;
  final String actionLabel;
  final VoidCallback onLogin;

  const _LoginRequiredView({
    required this.message,
    required this.actionLabel,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 64,
              color: context.colors.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: onLogin,
              child: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
