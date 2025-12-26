import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/theme/providers/theme_provider.dart';
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
      _ => 'User',
    };
    final userEmail = switch (user) {
      AuthenticatedUserData(:final email) => email,
      _ => '',
    };
    final isBeta = switch (user) {
      AuthenticatedUserData(:final isBeta) => isBeta,
      _ => false,
    };

    return SafeArea(
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

          // Preferences Section - Customization
          _SettingsSection(
            title: tr.settings.sections.preferences,
            children: const [
              _ThemeSwitcherTile(),
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
                  launchUrl(Uri.parse("https://apparencekit.dev/privacy/"));
                },
              ),
              SettingsTile(
                icon: Icons.help,
                title: tr.settings.support,
                onTap: () {
                  launchUrl(Uri.parse("https://apparencekit.dev/"));
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
                color: context.colors.onBackground.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
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
    final colorScheme = Theme.of(context).colorScheme;
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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: colorScheme.onBackground.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.surface,
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
                    color: Colors.blueGrey.withValues(alpha: 0.1),
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
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: const AssetImage('assets/images/avatar.png'),
            backgroundColor: colorScheme.surfaceContainerHighest,
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: colorScheme.onSurface,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isBeta) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Beta',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: colorScheme.onPrimaryContainer,
                              ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
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

class _ThemeSwitcherTile extends StatefulWidget {
  const _ThemeSwitcherTile();

  @override
  State<_ThemeSwitcherTile> createState() => _ThemeSwitcherTileState();
}

class _ThemeSwitcherTileState extends State<_ThemeSwitcherTile> {
  bool darkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      darkMode = ThemeProvider.of(context).mode == ThemeMode.dark;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            darkMode ? Icons.dark_mode : Icons.light_mode,
            size: 21,
            color: colorScheme.onSurface,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tr.settings.theme_mode,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Switch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
              ThemeProvider.of(context).toggle();
            },
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
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog.adaptive(
              title: Text(tr.settings.disconnect),
              content: Text(tr.settings.disconnect_confirm),
              actions: <Widget>[
                TextButton(
                  child: Text(tr.common.cancel),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                ),
                TextButton(
                  child: Text(tr.settings.disconnect),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    onSignOut();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.logout,
              size: 21,
              color: colorScheme.onSurface,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                tr.settings.disconnect,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
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
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog.adaptive(
              title: Text(tr.settings.delete_account),
              content: Text(tr.settings.delete_account_confirm),
              actions: <Widget>[
                TextButton(
                  child: Text(tr.common.cancel),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    tr.settings.delete_account,
                    style: const TextStyle(color: Colors.red),
                  ),
                  onPressed: () async {
                    Navigator.of(dialogContext).pop();
                    await ref.read(userStateNotifierProvider.notifier).deleteAccount();
                    if (context.mounted) {
                      context.go('/signin');
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.delete_forever,
              size: 21,
              color: Colors.red,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                tr.settings.delete_account,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.red.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
