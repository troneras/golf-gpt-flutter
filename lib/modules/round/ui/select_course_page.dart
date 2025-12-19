import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/providers/models/select_course_state.dart';
import 'package:apparence_kit/modules/round/providers/select_course_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Alias for the generated provider
const activeRoundNotifierProvider = activeRoundProvider;

class SelectCoursePage extends ConsumerWidget {
  const SelectCoursePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectCourseProvider);
    final tr = Translations.of(context).select_course;
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
      ),
      body: switch (state) {
        SelectCourseStateLoading() => const _LoadingView(),
        SelectCourseStateLoaded(:final course, :final selectedTee, :final isManuallySelected, :final gpsEnabled) =>
          _LoadedView(
            course: course,
            selectedTee: selectedTee,
            isManuallySelected: isManuallySelected,
            gpsEnabled: gpsEnabled,
            onTeeSelected: (tee) {
              ref.read(selectCourseProvider.notifier).selectTee(tee);
            },
            onGpsToggle: () {
              ref.read(selectCourseProvider.notifier).toggleGps();
            },
            onCancel: () => context.pop(),
            onStartRound: () async {
              HapticFeedback.mediumImpact();
              if (selectedTee == null) return;

              // Start the round
              await ref.read(activeRoundNotifierProvider.notifier).startRound(
                courseId: course.id,
                teeId: selectedTee.id,
                gpsEnabled: gpsEnabled,
              );

              // Check if round was started successfully
              final roundState = ref.read(activeRoundNotifierProvider);
              if (roundState is ActiveRoundStateActive) {
                // Navigate to round in progress
                if (context.mounted) {
                  context.go('/round-in-progress');
                }
              } else if (roundState is ActiveRoundStateError) {
                // Show error
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${roundState.message}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            onSelectOther: () async {
              final selectedCourse = await context.push<Course>('/browse-courses');
              if (selectedCourse != null) {
                ref.read(selectCourseProvider.notifier).setCourse(selectedCourse);
              }
            },
          ),
        SelectCourseStateNoCourseFound() => _NoCourseFoundView(
            onRetry: () {
              ref.read(selectCourseProvider.notifier).retry();
            },
            onCancel: () => context.pop(),
          ),
        SelectCourseStateError(:final message) => _ErrorView(
            message: message,
            onRetry: () {
              ref.read(selectCourseProvider.notifier).retry();
            },
            onCancel: () => context.pop(),
          ),
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(
            tr.loading,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onBackground.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final Course course;
  final Tee? selectedTee;
  final bool isManuallySelected;
  final bool gpsEnabled;
  final void Function(Tee) onTeeSelected;
  final VoidCallback onGpsToggle;
  final VoidCallback onCancel;
  final Future<void> Function() onStartRound;
  final VoidCallback onSelectOther;

  const _LoadedView({
    required this.course,
    required this.selectedTee,
    required this.isManuallySelected,
    required this.gpsEnabled,
    required this.onTeeSelected,
    required this.onGpsToggle,
    required this.onCancel,
    required this.onStartRound,
    required this.onSelectOther,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Closest course section - only show if not manually selected
                if (!isManuallySelected) ...[
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/ic_gps_pin.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        tr.closest_course,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onBackground.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
                // Course card
                _CourseCard(
                  courseName: course.name,
                  clubName: course.clubName,
                  onSelectOther: onSelectOther,
                ),
                const SizedBox(height: 24),
                // Tees section
                Text(
                  tr.tees_section,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                // Tees list
                ...course.tees.map<Widget>((tee) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _TeeCard(
                    tee: tee,
                    isSelected: selectedTee?.id == tee.id,
                    onTap: () => onTeeSelected(tee),
                  ),
                )),
                const SizedBox(height: 24),
                // Settings section
                Text(
                  tr.settings_section,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                _GpsToggleCard(
                  isEnabled: gpsEnabled,
                  onToggle: onGpsToggle,
                ),
              ],
            ),
          ),
        ),
        // Bottom buttons
        _BottomButtons(
          onCancel: onCancel,
          onStartRound: selectedTee != null ? onStartRound : null,
        ),
      ],
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String courseName;
  final String? clubName;
  final VoidCallback onSelectOther;

  const _CourseCard({
    required this.courseName,
    this.clubName,
    required this.onSelectOther,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        onTap: onSelectOther,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/avatars/av_green.png',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (clubName != null && clubName!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        clubName!,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      tr.select_other_course,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.primary,
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

class _TeeCard extends StatelessWidget {
  final Tee tee;
  final bool isSelected;
  final VoidCallback onTap;

  const _TeeCard({
    required this.tee,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFFF8E1)
            : context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? const Color(0xFFFDD835)
              : context.colors.onSurface.withValues(alpha: 0.1),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: tee.displayColor,
                  shape: BoxShape.circle,
                  border: tee.isLightColor
                      ? Border.all(color: Colors.grey.shade400, width: 1)
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tee.name,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (tee.totalLength != null)
                      Text(
                        tee.formattedLength,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                  ],
                ),
              ),
              if (tee.totalLength != null)
                Text(
                  tee.formattedLength,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected
                        ? context.colors.onBackground
                        : context.colors.onSurface.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GpsToggleCard extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onToggle;

  const _GpsToggleCard({
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                Icons.gps_fixed,
                size: 24,
                color: isEnabled ? context.colors.primary : context.colors.onSurface.withValues(alpha: 0.4),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.gps_tracking,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      tr.gps_tracking_description,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: (_) => onToggle(),
                activeTrackColor: context.colors.primary.withValues(alpha: 0.5),
                activeThumbColor: context.colors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback? onStartRound;

  const _BottomButtons({
    required this.onCancel,
    required this.onStartRound,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.background,
        border: Border(
          top: BorderSide(
            color: context.colors.onSurface.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: context.colors.onSurface.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  tr.common.cancel,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: onStartRound != null
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF8BC34A),
                            Color(0xFF689F38),
                          ],
                        )
                      : null,
                  color: onStartRound == null
                      ? context.colors.onSurface.withValues(alpha: 0.1)
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onStartRound,
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text(
                        tr.home.start_round,
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: onStartRound != null
                              ? Colors.white
                              : context.colors.onSurface.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoCourseFoundView extends StatelessWidget {
  final VoidCallback onRetry;
  final VoidCallback onCancel;

  const _NoCourseFoundView({
    required this.onRetry,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 64,
            color: context.colors.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 24),
          Text(
            tr.no_course_found,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            tr.no_course_found_hint,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onCancel,
                child: Text(Translations.of(context).common.cancel),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: onRetry,
                child: Text(tr.retry),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final VoidCallback onCancel;

  const _ErrorView({
    required this.message,
    required this.onRetry,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: context.colors.error,
          ),
          const SizedBox(height: 24),
          Text(
            tr.error_title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onCancel,
                child: Text(Translations.of(context).common.cancel),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: onRetry,
                child: Text(tr.retry),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
