import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
import 'package:apparence_kit/core/widgets/shooting_stars.dart';
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
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(homeTr.location_required_title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationTr.description,
              style: context.textTheme.bodyLarge,
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
              style: context.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _startRoundWithoutGps();
            },
            child: Text(homeTr.play_without_gps),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              openAppSettings();
            },
            child: Text(homeTr.location_required_action),
          ),
        ],
      ),
    );
  }

  void _startRoundWithoutGps() {
    HapticFeedback.mediumImpact();
    context.push('/select-course', extra: {'gpsEnabled': false});
  }

  void _showActiveRoundDialog(Round activeRound) {
    final tr = Translations.of(context).active_round;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr.message(courseName: activeRound.course.name),
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              tr.holes_played(count: activeRound.holesPlayed),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _finishActiveRound(activeRound);
            },
            child: Text(tr.finish),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _resumeActiveRound(activeRound);
            },
            child: Text(tr.resume),
          ),
        ],
      ),
    );
  }

  void _resumeActiveRound(Round activeRound) {
    HapticFeedback.mediumImpact();
    context.push('/round-in-progress', extra: {'roundId': activeRound.id});
  }

  Future<void> _finishActiveRound(Round activeRound) async {
    HapticFeedback.mediumImpact();
    // Load the round into the notifier first
    await ref.read(activeRoundNotifierProvider.notifier).loadRound(activeRound.id);
    if (!mounted) return;
    // Then navigate to round summary via the finish flow
    context.push('/round-in-progress', extra: {'roundId': activeRound.id});
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).home;
    final backgroundColor = context.colors.background;
    return Stack(
      children: [
        // Background image - full screen golf course
        Positioned.fill(
          child: Image.asset(
            'assets/images/background-2.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Dark gradient overlay from bottom for readability
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 1.0],
                colors: [
                  backgroundColor.withValues(alpha: 0.3),
                  backgroundColor.withValues(alpha: 0.1),
                  backgroundColor.withValues(alpha: 0.6),
                  backgroundColor.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
        ),
        // Shooting stars in the night sky
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ShootingStars(
            height: 200,
            spawnInterval: Duration(seconds: 3),
            maxStars: 2,
          ),
        ),
        // Main content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  'Juega solo con la voz',
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
      ],
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
