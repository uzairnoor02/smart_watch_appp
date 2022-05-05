import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'main.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class LocalNotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  static Future init({bool initScheduled = true}) async {
    tz.initializeTimeZones();
    final android = AndroidInitializationSettings("@mipmap/ic_launcher");
    final settings = InitializationSettings(
      android: android,
    );

    ///When app is closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotification.add(details.payload);
    }

    ///When Click on Notification
    await _notifications.initialize(settings,
        onSelectNotification: ((payload) async {
      onNotification.add(payload);
    }));

    if (initScheduled) {
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification(
      {required int id, required String title, required String message}) async {
    flutterLocalNotificationsPlugin.show(
        id,
        title,
        message,
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.max,
                color: Colors.blue,
                playSound: true,
                // vibrationPattern: ,
                icon: "@mipmap/ic_launcher")));
  }

  static Future showScheduleNotification(
      {required int id,
      required String title,
      required String message,
      required int hour,
      required int mint,
      required int second,
      required DateTime scheduleDate}) async {
    Future<tz.TZDateTime> _scheduleDaily(Time time) async {
      final now = tz.TZDateTime.now(tz.local);
      final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
          time.hour, time.minute, time.second);

      return scheduleDate.isBefore(now)
          ? scheduleDate.add(const Duration(days: 1))
          : scheduleDate;
    }

    _notifications.zonedSchedule(
      id,
      title,
      message,
      // put hours mint and second here
      await _scheduleDaily(Time(hour, mint, second)),
      // tz.TZDateTime.from(scheduleDate, tz.local),
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              importance: Importance.max,
              color: Colors.blue,
              playSound: true,
              // vibrationPattern: ,
              icon: "@mipmap/ic_launcher")),
      // payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static void cancel(int id) {
    _notifications.cancel(id);
  }
}
