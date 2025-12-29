import 'dart:async';

import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/providers/browse_courses_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/browse_courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class BrowseCoursesPage extends ConsumerStatefulWidget {
  final int initialTab;

  const BrowseCoursesPage({super.key, this.initialTab = 0});

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
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTab.clamp(0, 2),
    );
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
          icon: Icon(Icons.arrow_back, color: Colors.white.withValues(alpha: 0.9)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          tr.title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withValues(alpha: 0.4),
              indicatorColor: context.colors.primary,
              indicatorWeight: 2.5,
              labelStyle: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
              tabs: [
                Tab(text: tr.tab_nearby),
                Tab(text: tr.tab_recent),
                Tab(text: tr.tab_search),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _NearbyTab(
            state: state,
            onCourseSelected: _onCourseSelected,
            onRetry: () => ref.read(browseCoursesProvider.notifier).retry(),
            onOpenSettings: () => openAppSettings(),
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
  final VoidCallback onOpenSettings;

  const _NearbyTab({
    required this.state,
    required this.onCourseSelected,
    required this.onRetry,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).browse_courses;
    if (state.isLoadingNearby) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.nearbyError == 'location_permission_required') {
      return _LocationPermissionRequiredView(
        message: tr.location_permission_required,
        hint: tr.location_permission_hint,
        actionLabel: tr.open_settings,
        onOpenSettings: onOpenSettings,
      );
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
    // Glass style for search input
    const baseColor = Color(0xFF141A24);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: onSearchChanged,
            style: const TextStyle(color: Colors.white),
            cursorColor: context.colors.primary,
            decoration: InputDecoration(
              hintText: tr.search_placeholder,
              hintStyle: TextStyle(
                color: Colors.white.withValues(alpha: 0.4),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white.withValues(alpha: 0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: context.colors.primary.withValues(alpha: 0.6),
                ),
              ),
              filled: true,
              fillColor: baseColor.withValues(alpha: 0.85),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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

  String _buildSubtitle(Course course) {
    final parts = <String>[];
    if (course.cityCountry.isNotEmpty) {
      parts.add(course.cityCountry);
    }
    if (course.formattedDistance.isNotEmpty) {
      parts.add(course.formattedDistance);
    }
    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    // Matte glass style
    const baseColor = Color(0xFF141A24);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Golf flag icon with subtle tint
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/icons/ic_flag.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.clubName != null && course.clubName!.isNotEmpty
                          ? '${course.clubName} - ${course.name}'
                          : course.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (course.cityCountry.isNotEmpty ||
                        course.formattedDistance.isNotEmpty)
                      Text(
                        _buildSubtitle(course),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white.withValues(alpha: 0.3),
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
              color: Colors.white.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            if (hint != null) ...[
              const SizedBox(height: 8),
              Text(
                hint!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.4),
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
    // Muted error color
    const mutedError = Color(0xFFCF6B6B);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: mutedError.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _GhostButton(
              label: tr.retry,
              onPressed: onRetry,
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
              color: Colors.white.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _PrimaryButton(
              label: actionLabel,
              onPressed: onLogin,
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationPermissionRequiredView extends StatelessWidget {
  final String message;
  final String hint;
  final String actionLabel;
  final VoidCallback onOpenSettings;

  const _LocationPermissionRequiredView({
    required this.message,
    required this.hint,
    required this.actionLabel,
    required this.onOpenSettings,
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
              Icons.location_off_outlined,
              size: 64,
              color: Colors.white.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              hint,
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.4),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _PrimaryButton(
              label: actionLabel,
              icon: Icons.settings,
              onPressed: onOpenSettings,
            ),
          ],
        ),
      ),
    );
  }
}

/// Ghost button - secondary action with outline
class _GhostButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _GhostButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Text(
                label,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Primary button with glow effect
class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const _PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colors.primary.withValues(alpha: 0.9),
            context.colors.primary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 18,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
