import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/round/providers/active_round_check_provider.dart';
import 'package:apparence_kit/modules/round/providers/active_round_notifier.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/voice_caddy_prompt_card.dart';
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
        // Background image with gradient fade
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
                // Gradient overlay for fade effect
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 100,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          backgroundColor.withValues(alpha: 0),
                          backgroundColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Main content
        SafeArea(
          child: Column(
            children: [
              // Header section with mascot
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/foreground.png',
                      height: 180,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr.title,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          tr.title_ready,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Content section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Voice Caddy Connection Card
                      const VoiceCaddyPromptCard(),
                      const SizedBox(height: 16),
                      // Start Round Button
                      _StartRoundButton(
                        onPressed: _isCheckingPermission ? null : _handleStartRound,
                        isLoading: _isCheckingPermission,
                        label: tr.start_round.toUpperCase(),
                      ),
                      const SizedBox(height: 12),
                      // GPS hint
                      Text(
                        tr.gps_hint,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onBackground.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Voice commands section
                      _VoiceCommandsSection(
                        title: tr.say_things_like,
                        examples: [
                          tr.example_1,
                          tr.example_2,
                          tr.example_3,
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StartRoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  const _StartRoundButton({
    required this.onPressed,
    required this.isLoading,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF8BC34A),
            Color(0xFF689F38),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF689F38).withValues(alpha: 0.4),
            blurRadius: 8,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else ...[
                  Image.asset(
                    'assets/images/icons/ic_play_white.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VoiceCommandsSection extends StatelessWidget {
  final String title;
  final List<String> examples;

  const _VoiceCommandsSection({
    required this.title,
    required this.examples,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/icons/ic_chat.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...examples.map((example) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: context.colors.onSurface.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      example,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              )),
        ],
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
