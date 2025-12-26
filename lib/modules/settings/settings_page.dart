import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/theme/providers/theme_provider.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/settings/ui/components/delete_user_component.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/location_permission_tile.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/notification_permission_tile.dart';
import 'package:apparence_kit/modules/settings/ui/widgets/settings_tile.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/voice_caddy_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('settings_opened', {});
    });
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              tr.settings.title,
              style: context.textTheme.headlineLarge!.copyWith(
                color: context.colors.onBackground,
              ),
            ),
            const SizedBox(height: 24),
            ProfileTile(
              title: userName,
              subtitle: userEmail,
              isBeta: isBeta,
            ),
            const SizedBox(height: 24),
            SettingsContainer(
              child: Wrap(
                children: [
                  const ThemeSwitcher(),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  const LocationPermissionTile(),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  const NotificationPermissionTile(),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  const VoiceCaddySettingsTile(),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.golf_course,
                    title: tr.settings.my_bag,
                    onTap: () => context.push('/bag'),
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.message_rounded,
                    title: tr.settings.send_feedback,
                    onTap: () => context.push('/feedback'),
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.privacy_tip,
                    title: tr.settings.privacy_policy,
                    onTap: () {
                      launchUrl(Uri.parse("https://apparencekit.dev/privacy/"));
                    },
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.help,
                    title: tr.settings.support,
                    onTap: () {
                      launchUrl(Uri.parse("https://apparencekit.dev/"));
                    },
                  ),
                  Divider(color: Colors.blueGrey.withValues(alpha: .10)),
                  SettingsTile(
                    icon: Icons.logout,
                    title: tr.settings.disconnect,
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
                                onPressed: () async {
                                  Navigator.of(dialogContext).pop();
                                  await ref
                                      .read(userStateNotifierProvider.notifier)
                                      .onLogout();
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
                  ),
                ],
              ),
            ),
            const DeleteUserButton(),
          ],
        ),
      ),
    );
  }
}

class SettingsContainer extends StatelessWidget {
  final Widget child;

  const SettingsContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
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
    return SettingsContainer(
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: const AssetImage('assets/images/avatar.png'),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isBeta) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '🧪 Beta tester',
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                        color: Theme.of(context).colorScheme.onSurface,
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

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
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
    return SwitchListTile(
      value: darkMode,
      onChanged: (value) {
        setState(() {
          darkMode = value;
        });
        ThemeProvider.of(context).toggle();
      },
      title: Text(
        tr.settings.theme_mode,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
