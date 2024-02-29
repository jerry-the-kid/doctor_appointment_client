import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Duration calculateDuration(DateTime start, DateTime end) {
  return end.difference(start);
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final onClickNotification = BehaviorSubject();

  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  // initialize the notification
  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            linux: initializationSettingsLinux);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  // show a simple notification
  static Future showSimpleNotification(
      {required String body,
      required String title,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_1', 'channel_1',
            channelDescription: 'instant notification',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  // show schedule a local notification
  static Future showScheduleNotification(
      {required String body,
      required String title,
      required String payload,
      required DateTime scheduleTime}) async {
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local)
            .add(calculateDuration(DateTime.now(), scheduleTime)),
        const NotificationDetails(
            android: AndroidNotificationDetails('channel_3', 'channel_3',
                channelDescription: 'schedule notification')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
