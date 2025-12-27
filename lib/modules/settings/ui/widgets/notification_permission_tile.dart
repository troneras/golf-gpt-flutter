import 'dart:io';

import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

/// Shows notification permission status (Android only).
/// On iOS, this widget returns an empty SizedBox.
class NotificationPermissionTile extends ConsumerStatefulWidget {
  const NotificationPermissionTile({super.key});

  @override
  ConsumerState<NotificationPermissionTile> createState() =>
      _NotificationPermissionTileState();
}

class _NotificationPermissionTileState extends ConsumerState<NotificationPermissionTile>
    with WidgetsBindingObserver {
  PermissionStatus? _status;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermission();
    }
  }

  Future<void> _checkPermission() async {
    if (!Platform.isAndroid) return;
    final previousStatus = _status;
    final status = await Permission.notification.status;
    if (mounted) {
      // Track if permission was just granted (changed from denied to granted)
      if (previousStatus != null &&
          !previousStatus.isGranted &&
          status.isGranted) {
        ref.read(analyticsApiProvider).logEvent('permission_granted', {
          'permission_type': 'notification',
          'context': 'settings',
        });
      }
      setState(() {
        _status = status;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show on Android
    if (!Platform.isAndroid) {
      return const SizedBox.shrink();
    }

    final tr = Translations.of(context).settings.notification_permission;
    final isGranted = _status?.isGranted ?? false;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.notifications,
            size: 21,
            color: colorScheme.onSurface,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  tr.subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          if (_status == null)
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (isGranted)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 18,
                  color: Colors.green.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  tr.granted,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green.shade600,
                  ),
                ),
              ],
            )
          else
            TextButton(
              onPressed: () => openAppSettings(),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: 18,
                    color: Colors.orange.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    tr.open_settings,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.primary,
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
