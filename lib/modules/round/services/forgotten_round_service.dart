import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

/// Timeout before showing the "still playing?" reminder
const Duration kForgottenRoundTimeout = Duration(hours: 6);

/// Snooze duration when user chooses "Keep Playing"
const Duration kForgottenRoundSnooze = Duration(hours: 2);

/// Fixed notification ID for forgotten round reminders
const int kForgottenRoundNotificationId = 9001;

/// Notification channel for round reminders
const String kRoundReminderChannel = 'round_reminder';

/// Payload identifier for forgotten round notifications
const String kForgottenRoundPayload = 'forgotten_round';

final forgottenRoundServiceProvider = Provider<ForgottenRoundService>((ref) {
  return ForgottenRoundService(
    notificationManager: FlutterLocalNotificationsPlugin(),
  );
});

/// Service that schedules reminders for forgotten rounds.
///
/// When a round starts, a notification is scheduled to fire after
/// [kForgottenRoundTimeout]. If the round is still active when the
/// notification fires, the user is prompted to end or continue.
class ForgottenRoundService {
  final FlutterLocalNotificationsPlugin _notificationManager;

  ForgottenRoundService({
    required FlutterLocalNotificationsPlugin notificationManager,
  }) : _notificationManager = notificationManager;

  /// Schedule a reminder notification for an active round.
  ///
  /// Call this when a round starts or is resumed.
  Future<void> scheduleReminder({
    required String roundId,
    String? courseName,
    Duration timeout = kForgottenRoundTimeout,
  }) async {
    _logger.i('Scheduling forgotten round reminder for $roundId in ${timeout.inHours}h');

    // Cancel any existing reminder first
    await cancelReminder();

    tz.initializeTimeZones();
    final scheduledDate = tz.TZDateTime.now(tz.local).add(timeout);

    const androidDetails = AndroidNotificationDetails(
      kRoundReminderChannel,
      'Recordatorios de ronda',
      channelDescription: 'Notificaciones cuando una ronda lleva mucho tiempo activa',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      threadIdentifier: kRoundReminderChannel,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Build notification body with course name if available
    final hours = timeout.inHours;
    final body = courseName != null
        ? 'Tu ronda en $courseName lleva activa $hours horas'
        : 'Tu ronda lleva activa $hours horas';

    await _notificationManager.zonedSchedule(
      kForgottenRoundNotificationId,
      'Sigues jugando?',
      body,
      scheduledDate,
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: kForgottenRoundPayload,
    );

    _logger.i('Reminder scheduled for ${scheduledDate.toIso8601String()}');
  }

  /// Cancel any pending forgotten round reminder.
  ///
  /// Call this when a round ends normally.
  Future<void> cancelReminder() async {
    _logger.i('Cancelling forgotten round reminder');
    await _notificationManager.cancel(kForgottenRoundNotificationId);
  }

  /// Snooze the reminder for an additional duration.
  ///
  /// Call this when the user taps "Keep Playing" on the reminder dialog.
  Future<void> snoozeReminder({
    String? courseName,
    Duration snooze = kForgottenRoundSnooze,
  }) async {
    _logger.i('Snoozing forgotten round reminder for ${snooze.inHours}h');

    // Schedule a new reminder with the snooze duration
    await scheduleReminder(
      roundId: '', // Not needed for snooze
      courseName: courseName,
      timeout: snooze,
    );
  }

  /// Check if there's a pending forgotten round reminder.
  Future<bool> hasPendingReminder() async {
    final pending = await _notificationManager.pendingNotificationRequests();
    return pending.any((r) => r.id == kForgottenRoundNotificationId);
  }
}
