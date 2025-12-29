import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionTile extends ConsumerStatefulWidget {
  const LocationPermissionTile({super.key});

  @override
  ConsumerState<LocationPermissionTile> createState() => _LocationPermissionTileState();
}

class _LocationPermissionTileState extends ConsumerState<LocationPermissionTile>
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
    final previousStatus = _status;
    final status = await Permission.locationWhenInUse.status;
    if (mounted) {
      // Track if permission was just granted (changed from denied to granted)
      if (previousStatus != null &&
          !previousStatus.isGranted &&
          status.isGranted) {
        ref.read(analyticsApiProvider).logEvent('permission_granted', {
          'permission_type': 'location',
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
    final tr = Translations.of(context).settings.location_permission;
    final isGranted = _status?.isGranted ?? false;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 21,
            color: Colors.white.withValues(alpha: 0.6),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: colors.onBackground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  tr.subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          if (_status == null)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colors.primary,
              ),
            )
          else if (isGranted)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 18,
                  color: colors.success,
                ),
                const SizedBox(width: 4),
                Text(
                  tr.granted,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.success,
                  ),
                ),
              ],
            )
          else
            InkWell(
              onTap: () => openAppSettings(),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 18,
                      color: colors.warning,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      tr.open_settings,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
