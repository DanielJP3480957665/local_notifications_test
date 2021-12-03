import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // Future<void> notifyIos() {
  //   final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
  //   return flutterLocalNotificationPlugin
  //       .initialize(
  //     const InitializationSettings(
  //       iOS: IOSInitializationSettings(),
  //     ),
  //   )
  //       .then((_) => flutterLocalNotificationPlugin.show(
  //       0, 'title', 'body', const NotificationDetails()));
  // }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //androidとiphoneの通知処理
  Future<void> notify() {
    final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    return flutterLocalNotificationPlugin
        .initialize(
          const InitializationSettings(
            iOS: IOSInitializationSettings(),
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          ),
        )
        .then((_) => flutterLocalNotificationPlugin.show(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'あ',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        onPressed: notifyIos,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
