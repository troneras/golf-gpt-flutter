# Forgotten Round Detector

## Problem

Users may forget to end their round, leaving GPS tracking active indefinitely. This:
- Drains battery unnecessarily
- Creates incomplete round data
- May trigger app store review concerns ("why is GPS always on?")

## Solution

Schedule a local notification when a round starts that fires after a configurable timeout (e.g., 6 hours). If the round is still active, prompt the user to end it or continue playing.

---

## User Stories

### Primary
> As a golfer, I want to be reminded if I forget to end my round, so my battery isn't drained and my round data is complete.

### Secondary
> As a golfer who plays 36 holes, I want to dismiss the reminder and continue my round without interruption.

---

## Technical Design

### Key Insight: No Boot Receiver Needed

The notification is scheduled **when the round starts** (app is in foreground). If the device reboots mid-round:
- The notification is lost, BUT
- The GPS tracking service also stops
- User will re-open the app to continue, which can re-schedule the reminder

This avoids the need for `RECEIVE_BOOT_COMPLETED` permission.

### Flow

```
Round Starts
    ↓
Schedule local notification for T+6 hours
    ↓
Store notification ID in round state
    ↓
... user plays ...
    ↓
Round Ends (user action)
    ↓
Cancel scheduled notification
```

```
Round Still Active at T+6 hours
    ↓
Notification fires: "Still playing? Your round has been active for 6 hours"
    ↓
User taps notification → Opens app → Shows dialog:
    [End Round]  [Keep Playing (+2h)]
    ↓
If "Keep Playing" → Schedule another reminder for T+2 hours
```

### Components

| Component | Responsibility |
|-----------|----------------|
| `ForgottenRoundService` | Schedule/cancel notifications, handle snooze logic |
| `LocalNotifier` | Low-level notification API (existing) |
| `ActiveRoundNotifier` | Calls service on `startRound()` / `finishRound()` |
| Deep link handler | Route notification tap to round page |

### Notification Payload

```dart
const forgottenRoundNotification = NotificationDetails(
  id: 9001, // Fixed ID for forgotten round
  title: 'Still playing?',
  body: 'Your round has been active for 6 hours. Tap to end or continue.',
  payload: 'forgotten_round', // For deep link routing
);
```

### Configuration

```dart
const Duration kForgottenRoundTimeout = Duration(hours: 6);
const Duration kForgottenRoundSnooze = Duration(hours: 2);
```

---

## API Design

### ForgottenRoundService

```dart
class ForgottenRoundService {
  final LocalNotifier _notifier;

  /// Schedule reminder when round starts
  Future<void> scheduleReminder({
    required String roundId,
    Duration timeout = kForgottenRoundTimeout,
  });

  /// Cancel reminder when round ends normally
  Future<void> cancelReminder();

  /// Snooze reminder (user chose "Keep Playing")
  Future<void> snoozeReminder({
    Duration snooze = kForgottenRoundSnooze,
  });
}
```

### Integration Points

**In `ActiveRoundNotifier.startRound()`:**
```dart
await _forgottenRoundService.scheduleReminder(roundId: round.id);
```

**In `ActiveRoundNotifier.finishRound()`:**
```dart
await _forgottenRoundService.cancelReminder();
```

**In notification tap handler:**
```dart
if (payload == 'forgotten_round') {
  // Navigate to round page with dialog
  router.go('/round-in-progress?showEndRoundDialog=true');
}
```

---

## Edge Cases

| Scenario | Behavior |
|----------|----------|
| User ends round before timeout | Notification cancelled, no action |
| User ignores notification | Notification stays in tray; GPS continues |
| User taps "Keep Playing" | New reminder scheduled for +2h |
| App killed / device reboots | Notification lost; GPS also stopped; user re-opens app |
| Multiple snoozes | Each snooze adds 2h; no limit (user's choice) |
| No active round when notification fires | Check round state; if no active round, dismiss silently |

---

## Localization

```json
{
  "forgotten_round": {
    "notification_title": "Still playing?",
    "notification_body": "Your round has been active for {hours} hours",
    "dialog_title": "End your round?",
    "dialog_body": "Your round at {courseName} has been active for a while.",
    "action_end": "End Round",
    "action_continue": "Keep Playing"
  }
}
```

Spanish (base):
```json
{
  "forgotten_round": {
    "notification_title": "Sigues jugando?",
    "notification_body": "Tu ronda lleva activa {hours} horas",
    "dialog_title": "Finalizar ronda?",
    "dialog_body": "Tu ronda en {courseName} lleva activa un buen rato.",
    "action_end": "Finalizar",
    "action_continue": "Seguir jugando"
  }
}
```

---

## Implementation Checklist

- [x] Create `ForgottenRoundService` in `lib/modules/round/services/`
- [x] Add `scheduleReminder()` call in `ActiveRoundNotifier.startRound()`
- [x] Add `cancelReminder()` call in `ActiveRoundNotifier.finishRound()`
- [x] Handle notification tap in `ForgottenRoundHandler`
- [x] Create "End Round" dialog component
- [x] Add translations to `es.i18n.json` and `en.i18n.json`
- [ ] Test: round ends before timeout → no notification
- [ ] Test: round active at timeout → notification fires
- [ ] Test: snooze works correctly

---

## Why This Doesn't Need RECEIVE_BOOT_COMPLETED

| Scenario | With Boot Receiver | Without Boot Receiver |
|----------|-------------------|----------------------|
| Normal flow | Notification fires | Notification fires |
| Device reboots mid-round | Notification re-scheduled | Notification lost, but GPS also stopped |
| User re-opens app after reboot | Round resumes, reminder active | Round resumes, new reminder scheduled |

The boot receiver adds complexity and review risk for minimal benefit. If the device reboots, the user will re-open the app anyway to continue their round.

---

## Future Enhancements

1. **Smart timeout** — Adjust based on pace of play (if 9 holes in 2h, extend timeout)
2. **Inactivity detection** — If no GPS movement for 30min, prompt earlier
3. **Auto-end** — After 24h with no activity, auto-end round with warning
