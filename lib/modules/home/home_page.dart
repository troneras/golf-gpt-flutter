import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/app_background.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
import 'package:apparence_kit/core/widgets/styled_dialog.dart';
import 'package:apparence_kit/core/widgets/suggestion_card.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/providers/active_round_check_provider.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

const activeRoundNotifierProvider = activeRoundProvider;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with WidgetsBindingObserver {
  bool _isCheckingPermission = false;
  bool _hasCheckedActiveRound = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkForActiveRound();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Re-check when app comes back to foreground
      _hasCheckedActiveRound = false;
      _checkForActiveRound();
    }
  }

  void _checkForActiveRound() {
    if (_hasCheckedActiveRound) return;
    _hasCheckedActiveRound = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      // Invalidate to get fresh data
      ref.invalidate(activeRoundCheckProvider);
      final activeRound = await ref.read(activeRoundCheckProvider.future);
      if (!mounted) return;
      if (activeRound != null) {
        _showActiveRoundDialog(activeRound);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _handleStartRound() async {
    if (_isCheckingPermission) return;
    setState(() => _isCheckingPermission = true);
    try {
      final status = await Permission.locationWhenInUse.status;
      if (status.isGranted) {
        _startRound();
        return;
      }
      if (status.isPermanentlyDenied) {
        if (mounted) {
          _showLocationRequiredDialog();
        }
        return;
      }
      // Show location permission bottom sheet before requesting system permission
      if (mounted) {
        final shouldRequest = await _showLocationPermissionBottomSheet();
        if (!shouldRequest) {
          return;
        }
      }
      final newStatus = await Permission.locationWhenInUse.request();
      if (newStatus.isGranted) {
        ref.read(analyticsApiProvider).logEvent('permission_granted', {
          'permission_type': 'location',
          'context': 'start_round',
        });
        _startRound();
      } else if (mounted) {
        ref.read(analyticsApiProvider).logEvent('permission_denied', {
          'permission_type': 'location',
          'context': 'start_round',
        });
        _showLocationRequiredDialog();
      }
    } finally {
      if (mounted) {
        setState(() => _isCheckingPermission = false);
      }
    }
  }

  Future<bool> _showLocationPermissionBottomSheet() async {
    final tr = Translations.of(context).onboarding.location_permission;
    final homeTr = Translations.of(context).home;
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.colors.onSurface.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // GPS Icon
                Icon(
                  Icons.location_on,
                  size: 48,
                  color: context.colors.primary,
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  tr.title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  tr.description,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 24),
                // Bullet points
                _LocationBulletPoint(icon: Icons.golf_course, text: tr.bullet_1),
                const SizedBox(height: 16),
                _LocationBulletPoint(icon: Icons.straighten, text: tr.bullet_2),
                const SizedBox(height: 16),
                _LocationBulletPoint(icon: Icons.sports_golf, text: tr.bullet_3),
                const SizedBox(height: 24),
                // Reassurance text
                Text(
                  tr.reassurance,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurface.withValues(alpha: 0.5),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 24),
                // Primary button
                ElevatedButton(
                  onPressed: () => Navigator.of(bottomSheetContext).pop(true),
                  child: Text(tr.action),
                ),
                const SizedBox(height: 8),
                // Skip button
                TextButton(
                  onPressed: () => Navigator.of(bottomSheetContext).pop(false),
                  child: Text(homeTr.play_without_gps),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (result == false) {
      _startRoundWithoutGps();
    }
    return result ?? false;
  }

  void _startRound() {
    HapticFeedback.mediumImpact();
    context.push('/select-course');
  }

  void _showLocationRequiredDialog() {
    final tr = Translations.of(context);
    final locationTr = tr.onboarding.location_permission;
    final homeTr = tr.home;
    final colors = context.colors;
    showStyledDialog(
      context: context,
      icon: Icon(
        Icons.location_on_outlined,
        size: 48,
        color: colors.primary,
      ),
      title: homeTr.location_required_title,
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locationTr.description,
            style: context.textTheme.bodyMedium?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          _DialogBulletPoint(icon: Icons.golf_course, text: locationTr.bullet_1),
          const SizedBox(height: 12),
          _DialogBulletPoint(icon: Icons.straighten, text: locationTr.bullet_2),
          const SizedBox(height: 12),
          _DialogBulletPoint(icon: Icons.sports_golf, text: locationTr.bullet_3),
          const SizedBox(height: 16),
          Text(
            locationTr.reassurance,
            style: context.textTheme.bodySmall?.copyWith(
              fontStyle: FontStyle.italic,
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
      actions: [
        StyledDialogAction.secondary(
          label: homeTr.play_without_gps,
          onTap: () {
            Navigator.of(context).pop();
            _startRoundWithoutGps();
          },
        ),
        StyledDialogAction.primary(
          label: homeTr.location_required_action,
          onTap: () {
            Navigator.of(context).pop();
            openAppSettings();
          },
        ),
      ],
    );
  }

  void _startRoundWithoutGps() {
    HapticFeedback.mediumImpact();
    context.push('/select-course', extra: {'gpsEnabled': false});
  }

  void _showActiveRoundDialog(Round activeRound) {
    if (!mounted) return;

    final tr = Translations.of(context).active_round;
    final colors = context.colors;
    final textTheme = context.textTheme;
    // Store navigator before showing dialog to avoid accessing disposed context in callbacks
    final navigator = Navigator.of(context);

    showStyledDialog(
      context: context,
      barrierDismissible: false,
      icon: Icon(
        Icons.golf_course,
        size: 48,
        color: colors.primary,
      ),
      title: tr.title,
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.message(courseName: activeRound.course.name),
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tr.holes_played(count: activeRound.holesPlayed),
            style: textTheme.bodySmall?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
      actions: [
        StyledDialogAction.secondary(
          label: tr.finish,
          onTap: () {
            navigator.pop();
            if (mounted) {
              _finishActiveRound(activeRound);
            }
          },
        ),
        StyledDialogAction.primary(
          label: tr.resume,
          onTap: () {
            navigator.pop();
            if (mounted) {
              _resumeActiveRound(activeRound);
            }
          },
        ),
      ],
    );
  }

  void _resumeActiveRound(Round activeRound) {
    HapticFeedback.mediumImpact();
    context.push('/round-in-progress', extra: {'roundId': activeRound.id});
  }

  void _finishActiveRound(Round activeRound) {
    HapticFeedback.mediumImpact();
    // Navigate to round screen with flag to show finish dialog
    context.push('/round-in-progress', extra: {
      'roundId': activeRound.id,
      'showFinishDialog': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).home;
    return AppBackground(
      child: SafeArea(
        bottom: false, // Allow content to extend behind bottom bar
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).padding.bottom + 72,
          ),
          child: Column(
            children: [
              const SizedBox(height: 48),
              // Header - TalkCaddy title
              Text(
                tr.title,
                style: context.textTheme.displayLarge?.copyWith(
                  color: context.colors.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              // Subtitle - Voice Caddie
              Text(
                'Voice Caddie',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const Spacer(),
              // Start Round Button - vertically centered
              GlowButton(
                text: tr.start_round.toUpperCase(),
                icon: Icons.play_arrow_rounded,
                onPressed: _isCheckingPermission ? null : _handleStartRound,
                isLoading: _isCheckingPermission,
              ),
              const SizedBox(height: 12),
              // Subtitle below button
              Text(
                tr.subtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              // AI Suggestion card with rotating suggestions
              const SuggestionCard(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogBulletPoint extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DialogBulletPoint({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: context.colors.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _LocationBulletPoint extends StatelessWidget {
  final IconData icon;
  final String text;

  const _LocationBulletPoint({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: context.colors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 22,
            color: context.colors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
