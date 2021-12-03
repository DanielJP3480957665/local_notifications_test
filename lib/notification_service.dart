import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationClass {
  Future<void> notifyIos() {
    final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    return flutterLocalNotificationPlugin
        .initialize(
          const InitializationSettings(
            iOS: IOSInitializationSettings(),
          ),
        )
        .then((_) => flutterLocalNotificationPlugin.show(
            0, 'title', 'body', const NotificationDetails()));
  }

  Future<void> notify() {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    return flutterLocalNotificationsPlugin
        .initialize(
          const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          ),
        )
        .then((_) => flutterLocalNotificationsPlugin.show(
            0,
            'title',
            'body',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'channel_id',
                'channel_name',
              ),
            )));
  }
}
