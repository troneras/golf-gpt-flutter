import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/location_permission_tile.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/notification_permission_tile.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/settings_tile.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/voice_caddy_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('settings_opened', {});
    });
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _appVersion = '${packageInfo.version} (${packageInfo.buildNumber})';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    final userState = ref.watch(userStateNotifierProvider);
    final user = userState.user;
    final userName = switch (user) {
      AuthenticatedUserData(:final name, :final email) => name ?? email,
      _ => tr.settings.default_user,
    };
    final userEmail = switch (user) {
      AuthenticatedUserData(:final email) => email,
      _ => '',
    };
    final isBeta = switch (user) {
      AuthenticatedUserData(:final isBeta) => isBeta,
      _ => false,
    };

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
        children: [
          Text(
            tr.settings.title,
            style: context.textTheme.headlineLarge!.copyWith(
              color: context.colors.onBackground,
            ),
          ),
          const SizedBox(height: 24),

          // Profile Section
          ProfileTile(
            title: userName,
            subtitle: userEmail,
            isBeta: isBeta,
          ),
          const SizedBox(height: 24),

          // Golf Section - Core app functionality first
          _SettingsSection(
            title: tr.settings.sections.golf,
            children: [
              SettingsTile(
                icon: Icons.golf_course,
                title: tr.settings.my_bag,
                onTap: () => context.push('/bag'),
              ),
              const VoiceCaddySettingsTile(),
            ],
          ),
          const SizedBox(height: 16),

          // Permissions Section - Technical settings
          _SettingsSection(
            title: tr.settings.sections.permissions,
            children: const [
              LocationPermissionTile(),
              NotificationPermissionTile(),
            ],
          ),
          const SizedBox(height: 16),

          // Help & Support Section
          _SettingsSection(
            title: tr.settings.sections.help,
            children: [
              SettingsTile(
                icon: Icons.message_rounded,
                title: tr.settings.send_feedback,
                onTap: () => context.push('/feedback'),
              ),
              SettingsTile(
                icon: Icons.privacy_tip,
                title: tr.settings.privacy_policy,
                onTap: () {
                  final lang = LocaleSettings.currentLocale.languageCode;
                  launchUrl(Uri.parse("https://talkcaddy.com/privacy-policy?lang=$lang"));
                },
              ),
              SettingsTile(
                icon: Icons.help,
                title: tr.settings.support,
                onTap: () {
                  final lang = LocaleSettings.currentLocale.languageCode;
                  launchUrl(Uri.parse("https://talkcaddy.com/faq?lang=$lang"));
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Account Section - Destructive actions last
          _SettingsSection(
            title: tr.settings.sections.account,
            children: [
              _SignOutTile(
                onSignOut: () async {
                  await ref.read(userStateNotifierProvider.notifier).onLogout();
                  if (context.mounted) {
                    context.go('/signin');
                  }
                },
              ),
              _DeleteAccountTile(),
            ],
          ),
          const SizedBox(height: 32),

          // App Version
          Center(
            child: Text(
              'TalkCaddy v$_appVersion',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.textTertiary,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final filteredChildren = children.where((child) {
      // Filter out empty widgets (like NotificationPermissionTile on iOS)
      return child is! SizedBox || (child.width != 0 && child.height != 0);
    }).toList();

    if (filteredChildren.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Matte Glass - Level 1 (Design System)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF141A24).withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < filteredChildren.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: filteredChildren[i],
                ),
                if (i < filteredChildren.length - 1)
                  Divider(
                    color: Colors.white.withValues(alpha: 0.06),
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isBeta;

  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isBeta = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // Prominent Glass - Level 2 (Design System)
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF141A24).withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.elevated,
              border: Border.all(
                color: colors.primary.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.person,
                  size: 32,
                  color: colors.textTertiary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: colors.onBackground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isBeta) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colors.primary.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          Translations.of(context).settings.beta_badge,
                          style: context.textTheme.labelSmall!.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SignOutTile extends StatelessWidget {
  final VoidCallback onSignOut;

  const _SignOutTile({required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    final colors = context.colors;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF141A24).withValues(alpha: 0.90),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: 48,
                        color: colors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tr.settings.disconnect,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        tr.settings.disconnect_confirm,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                  onTap: () => Navigator.of(dialogContext).pop(),
                                  borderRadius: BorderRadius.circular(12),
                                  child: Center(
                                    child: Text(
                                      tr.common.cancel,
                                      style: context.textTheme.titleSmall?.copyWith(
                                        color: colors.onSurface.withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colors.primary.withValues(alpha: 0.9),
                                    colors.primary,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.primary.withValues(alpha: 0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(dialogContext).pop();
                                    onSignOut();
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Center(
                                    child: Text(
                                      tr.settings.disconnect,
                                      style: context.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.logout,
              size: 21,
              color: Colors.white.withValues(alpha: 0.6),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                tr.settings.disconnect,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: colors.onBackground,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: colors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteAccountTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context);
    final colors = context.colors;
    // Using muted error color from design system (#CF6B6B)
    const mutedError = Color(0xFFCF6B6B);
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF141A24).withValues(alpha: 0.90),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        size: 48,
                        color: mutedError,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tr.settings.delete_account,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        tr.settings.delete_account_confirm,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                  onTap: () => Navigator.of(dialogContext).pop(),
                                  borderRadius: BorderRadius.circular(12),
                                  child: Center(
                                    child: Text(
                                      tr.common.cancel,
                                      style: context.textTheme.titleSmall?.copyWith(
                                        color: colors.onSurface.withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: mutedError.withValues(alpha: 0.15),
                                border: Border.all(
                                  color: mutedError.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.of(dialogContext).pop();
                                    await ref.read(userStateNotifierProvider.notifier).deleteAccount();
                                    if (context.mounted) {
                                      context.go('/signin');
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Center(
                                    child: Text(
                                      tr.settings.delete_account,
                                      style: context.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: mutedError,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.delete_forever,
              size: 21,
              color: mutedError.withValues(alpha: 0.8),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                tr.settings.delete_account,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: mutedError,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: mutedError.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
