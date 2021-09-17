
import 'package:firebasetest/screens/emergency%20unit/adminnotifhome.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'key1',
        channelName: 'AlertUs',
        channelDescription: 'Notifications',
        defaultColor: Color(0xFF9D50DD),
        playSound: true,
        enableLights: true,
        enableVibration: true)
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Notify();
          AwesomeNotifications().actionStream.listen((receivedNotification) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminNotifHome(),
                ));
          });
        },
        child: Icon(Icons.circle_notifications),
      )),
    );
  }
}

void Notify() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Notification Title',
          body: 'body of notification'));
}
