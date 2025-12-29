import 'package:apparence_kit/core/shared_preferences/shared_preferences.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/course.dart';
import 'package:apparence_kit/modules/round/domain/tee.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/round/providers/models/active_round_state.dart';
import 'package:apparence_kit/modules/round/providers/models/select_course_state.dart';
import 'package:apparence_kit/modules/round/providers/select_course_notifier.dart';
import 'package:apparence_kit/modules/round/ui/widgets/chatgpt_handoff_dialog.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

const _handoffShownKey = 'chatgpt_handoff_shown';

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
        SelectCourseStateLoaded(:final course, :final selectedTee, :final isManuallySelected, :final isRecentCourse, :final gpsEnabled, :final gpsTooFar) =>
          _LoadedView(
            course: course,
            selectedTee: selectedTee,
            isManuallySelected: isManuallySelected,
            isRecentCourse: isRecentCourse,
            gpsEnabled: gpsEnabled,
            gpsTooFar: gpsTooFar,
            onTeeSelected: (tee) {
              ref.read(selectCourseProvider.notifier).selectTee(tee);
            },
            onGpsToggle: () async {
              final result = await ref.read(selectCourseProvider.notifier).toggleGps();
              if (!context.mounted) return;
              final tr = Translations.of(context).select_course;
              switch (result) {
                case GpsToggleResult.success:
                  break;
                case GpsToggleResult.confirmFarCourse:
                  // GPS was enabled but course is far - ask for confirmation
                  final confirmed = await _showFarCourseGpsConfirmation(context, course.distanceKm ?? 0);
                  if (!confirmed) {
                    // User cancelled - disable GPS
                    ref.read(selectCourseProvider.notifier).disableGps();
                  }
                case GpsToggleResult.locationPermissionDenied:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(tr.gps_permission_required),
                      backgroundColor: Colors.orange,
                      action: SnackBarAction(
                        label: tr.open_settings,
                        textColor: Colors.white,
                        onPressed: () => openAppSettings(),
                      ),
                    ),
                  );
                case GpsToggleResult.notificationPermissionDenied:
                  // Show dialog for notification permission
                  final enableAnyway = await _showNotificationPermissionDialog(context);
                  if (enableAnyway && context.mounted) {
                    // User wants to enable GPS anyway - force enable
                    ref.read(selectCourseProvider.notifier).forceEnableGps();
                  }
              }
            },
            onCancel: () => context.pop(),
            onStartRound: () async {
              HapticFeedback.mediumImpact();
              if (selectedTee == null) return;

              // Step 1: Check if GPT is connected, if not trigger setup
              final userState = ref.read(userStateNotifierProvider);
              if (!userState.user.isGptConnected) {
                // Navigate to voice caddy setup and wait for completion
                await context.push('/voice-caddy-setup');
                // After returning, check again if user completed setup
                if (!context.mounted) return;
                final updatedUserState = ref.read(userStateNotifierProvider);
                if (!updatedUserState.user.isGptConnected) {
                  // User skipped setup, don't start round
                  return;
                }
              }

              // Step 2: If GPS is enabled, request notification permission (but don't block if denied)
              if (gpsEnabled) {
                final hasNotificationPerm = await ref
                    .read(selectCourseProvider.notifier)
                    .hasNotificationPermission();
                if (!hasNotificationPerm && context.mounted) {
                  // Show dialog but continue regardless of user choice
                  await _showNotificationPermissionDialog(context);
                }
              }

              if (!context.mounted) return;

              // Step 3: Start the round
              await ref.read(activeRoundNotifierProvider.notifier).startRound(
                courseId: course.id,
                teeId: selectedTee.id,
                gpsEnabled: gpsEnabled,
              );

              // Check if round was started successfully
              final roundState = ref.read(activeRoundNotifierProvider);
              if (roundState is ActiveRoundStateActive) {
                if (!context.mounted) return;
                // Check if this is the first time starting a round (per install)
                final prefs = ref.read(sharedPreferencesProvider).prefs;
                final hasSeenHandoff = prefs.getBool(_handoffShownKey) ?? false;
                if (!hasSeenHandoff) {
                  // Show the handoff dialog
                  await showChatgptHandoffDialog(context);
                  // Mark as shown for future rounds
                  await prefs.setBool(_handoffShownKey, true);
                }
                // Navigate to round in progress first (so it's ready when user returns)
                if (context.mounted) {
                  context.go('/round-in-progress');
                }
                // Open ChatGPT
                await ref.read(voiceCaddyProvider.notifier).openChatGPT();
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
            onSearchCourse: () async {
              final selectedCourse = await context.push<Course>('/browse-courses');
              if (selectedCourse != null) {
                ref.read(selectCourseProvider.notifier).setCourse(selectedCourse);
              }
            },
          ),
        SelectCourseStateRedirectToSearch() => _RedirectToSearchView(
            onNavigate: () async {
              // Navigate to browse courses with search tab (index 2)
              final selectedCourse = await context.push<Course>(
                '/browse-courses',
                extra: {'initialTab': 2},
              );
              if (selectedCourse != null) {
                ref.read(selectCourseProvider.notifier).setCourse(selectedCourse);
              } else {
                // User cancelled, go back
                if (context.mounted) {
                  context.pop();
                }
              }
            },
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

/// Shows a dialog when notification permission is denied on Android.
/// If user clicks continue, requests the actual system permission and waits for result.
/// Returns true if user clicked "continue" (regardless of permission outcome).
Future<bool> _showNotificationPermissionDialog(BuildContext context) async {
  final tr = Translations.of(context).select_course;

  final result = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(tr.notification_permission_title),
      content: Text(tr.notification_permission_message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop('cancel'),
          child: Text(tr.notification_permission_cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop('settings'),
          child: Text(tr.notification_permission_settings),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop('continue'),
          child: Text(tr.notification_permission_continue),
        ),
      ],
    ),
  );

  if (result == 'settings') {
    await openAppSettings();
    return false;
  } else if (result == 'continue') {
    // Request the actual system notification permission and wait for user decision
    await Permission.notification.request();
    return true;
  }
  return false;
}

/// Shows a confirmation dialog when enabling GPS for a course far from user's location.
Future<bool> _showFarCourseGpsConfirmation(BuildContext context, double distanceKm) async {
  final tr = Translations.of(context).select_course;
  final formattedDistance = distanceKm < 1
      ? '${(distanceKm * 1000).round()} m'
      : '${distanceKm.toStringAsFixed(1)} km';

  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(tr.far_course_gps_title),
      content: Text(tr.far_course_gps_message.replaceAll('{distance}', formattedDistance)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(tr.far_course_gps_disable),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(tr.far_course_gps_enable),
        ),
      ],
    ),
  );
  return result ?? false;
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
  final bool isRecentCourse;
  final bool gpsEnabled;
  final bool gpsTooFar;
  final void Function(Tee) onTeeSelected;
  final VoidCallback onGpsToggle;
  final VoidCallback onCancel;
  final Future<void> Function() onStartRound;
  final VoidCallback onSelectOther;

  const _LoadedView({
    required this.course,
    required this.selectedTee,
    required this.isManuallySelected,
    required this.isRecentCourse,
    required this.gpsEnabled,
    required this.gpsTooFar,
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
                // Course label section - only show if not manually selected
                if (!isManuallySelected) ...[
                  Row(
                    children: [
                      Image.asset(
                        isRecentCourse
                            ? 'assets/images/icons/ic_flag.png'
                            : 'assets/images/icons/ic_gps_pin.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isRecentCourse ? tr.recent_course : tr.closest_course,
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
                  isTooFar: gpsTooFar,
                  distanceKm: course.distanceKm,
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
  final bool isTooFar;
  final double? distanceKm;
  final VoidCallback onToggle;

  const _GpsToggleCard({
    required this.isEnabled,
    required this.isTooFar,
    required this.distanceKm,
    required this.onToggle,
  });

  String _formatDistance(double? km) {
    if (km == null) return '';
    if (km < 1) {
      return '${(km * 1000).round()} m';
    }
    return '${km.toStringAsFixed(1)} km';
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).select_course;
    // Show warning only if far AND GPS is disabled
    final showWarning = isTooFar && !isEnabled;
    final description = showWarning
        ? tr.gps_too_far.replaceAll('{distance}', _formatDistance(distanceKm))
        : tr.gps_tracking_description;
    return Container(
      decoration: BoxDecoration(
        color: showWarning
            ? Colors.orange.withValues(alpha: 0.1)
            : context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: showWarning
              ? Colors.orange.withValues(alpha: 0.3)
              : context.colors.onSurface.withValues(alpha: 0.1),
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
                isEnabled ? Icons.gps_fixed : Icons.gps_off,
                size: 24,
                color: isEnabled
                    ? context.colors.primary
                    : (showWarning ? Colors.orange : context.colors.onSurface.withValues(alpha: 0.4)),
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
                      description,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: showWarning
                            ? Colors.orange.shade700
                            : context.colors.onSurface.withValues(alpha: 0.6),
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
                        tr.select_course.start_round_cta,
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
  final VoidCallback onSearchCourse;

  const _NoCourseFoundView({
    required this.onRetry,
    required this.onCancel,
    required this.onSearchCourse,
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
          // Primary action: Search for a course
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onSearchCourse,
              icon: const Icon(Icons.search),
              label: Text(tr.search_course),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onCancel,
                child: Text(Translations.of(context).common.cancel),
              ),
              const SizedBox(width: 16),
              TextButton(
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

/// A view that automatically triggers navigation to the search tab.
/// This is displayed briefly while the redirect happens.
class _RedirectToSearchView extends StatefulWidget {
  final Future<void> Function() onNavigate;

  const _RedirectToSearchView({required this.onNavigate});

  @override
  State<_RedirectToSearchView> createState() => _RedirectToSearchViewState();
}

class _RedirectToSearchViewState extends State<_RedirectToSearchView> {
  @override
  void initState() {
    super.initState();
    // Trigger navigation after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onNavigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading while redirecting
    return const _LoadingView();
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
