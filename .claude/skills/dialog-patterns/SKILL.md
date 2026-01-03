---
name: dialog-patterns
description: Glass-morphism dialog and modal patterns used in TalkCaddy. Use when creating confirmation dialogs, action sheets, or modal popups following the app's dark theme design system.
---

# Dialog Patterns in TalkCaddy

## Overview

TalkCaddy uses a **glass-morphism dark theme** for dialogs with:
- Semi-transparent dark background (`Color(0xFF3A3A3A)` at 0.90 alpha)
- Subtle white border
- Drop shadow
- Gradient buttons

## Standard Confirmation Dialog

Use this pattern for destructive actions (sign out, delete, disconnect):

```dart
void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
  final tr = Translations.of(context);
  final colors = context.colors;

  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3A3A3A).withValues(alpha: 0.90),
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
                // Icon
                Icon(
                  Icons.warning_rounded,
                  size: 48,
                  color: colors.primary,
                ),
                const SizedBox(height: 16),

                // Title
                Text(
                  tr.dialog.title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  tr.dialog.description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    // Cancel button (outlined)
                    Expanded(
                      child: _OutlinedButton(
                        text: tr.common.cancel,
                        onTap: () => Navigator.of(dialogContext).pop(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Confirm button (filled gradient)
                    Expanded(
                      child: _GradientButton(
                        text: tr.dialog.confirm,
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                          _performAction(context, ref);
                        },
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
}
```

## Button Styles

### Outlined Button (Cancel/Secondary)

```dart
Container(
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Center(
        child: Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
    ),
  ),
)
```

### Gradient Button (Confirm/Primary)

```dart
Container(
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Center(
        child: Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ),
)
```

### Destructive Button (Delete/Danger)

```dart
// Use muted error color for destructive actions
const mutedError = Color(0xFFCF6B6B);

Container(
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Center(
        child: Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: mutedError,
          ),
        ),
      ),
    ),
  ),
)
```

## Common Icons for Dialogs

| Action | Icon |
|--------|------|
| Sign out | `Icons.logout_rounded` |
| Delete | `Icons.delete_outline_rounded` |
| Disconnect | `Icons.link_off_rounded` |
| Warning | `Icons.warning_rounded` |
| Success | `Icons.check_circle_rounded` |
| Info | `Icons.info_outline_rounded` |

## Design Constants

```dart
// Dialog background
const dialogBgColor = Color(0xFF3A3A3A);
const dialogBgAlpha = 0.90;

// Border
const borderColor = Colors.white;
const borderAlpha = 0.08;

// Shadow
const shadowColor = Colors.black;
const shadowAlpha = 0.4;
const shadowBlur = 24.0;
const shadowOffset = Offset(0, 8);

// Border radius
const dialogRadius = 16.0;
const buttonRadius = 12.0;

// Padding
const dialogPadding = EdgeInsets.all(24);

// Icon size
const iconSize = 48.0;

// Button height
const buttonHeight = 48.0;
```

## Handling Async Actions

When the dialog triggers an async action:

```dart
Future<void> _performAction(BuildContext context, WidgetRef ref) async {
  final tr = Translations.of(context);

  final success = await ref.read(myNotifier.notifier).doAction();

  if (!context.mounted) return;

  if (!success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(tr.error_message),
        backgroundColor: Colors.red.shade700,
      ),
    );
  }
}
```

## Real Examples in Codebase

- **Sign out dialog**: `lib/modules/settings/settings_page.dart` (line ~356)
- **Delete account dialog**: `lib/modules/settings/settings_page.dart` (line ~527)
- **Disconnect GPT dialog**: `lib/modules/voice_caddy/ui/widgets/voice_caddy_settings_tile.dart`
