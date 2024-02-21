// import 'dart:developer';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_template/utils/constants.dart';
// import 'package:rxdart/rxdart.dart';
//
// class FireBaseNotification {
//   static final FireBaseNotification _fireBaseNotification = FireBaseNotification.init();
//
//   factory FireBaseNotification() {
//     return _fireBaseNotification;
//   }
//
//   FireBaseNotification.init();
//
//   late FirebaseMessaging firebaseMessaging;
//   late AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     // 'This channel is used for important notifications.', // description
//     importance: Importance.high,
//   );
//
//   final _selectNotificationSubject = PublishSubject<String?>();
//
//   Stream<String?> get selectNotificationStream => _selectNotificationSubject.stream;
//
//   final _didReceiveLocalNotificationSubject = PublishSubject<ReceivedNotification>();
//
//   Stream<ReceivedNotification> get didReceiveLocalNotificationStream => _didReceiveLocalNotificationSubject.stream;
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   static bool isNotification = false;
//
//   void firebaseCloudMessagingLSetup() async {
//     firebaseMessaging = FirebaseMessaging.instance;
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     iOSPermission(firebaseMessaging);
//
//     await firebaseMessaging.getToken().then((token) {
//       Constants.firebaseToken = token!;
//       log('TOKEN to be Registered: $token');
//     });
//
//     // Fired when app is coming from a terminated state
//     var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) _showLocalNotification(initialMessage);
//
//     // Fired when app is in foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _showLocalNotification(message);
//       debugPrint('Got a message, app is in the foreground!');
//     });
//
//     // Fired when app is in foreground
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       selectNotification('playLoad -->');
//       debugPrint('Got a message, app is in the foreground!');
//     });
//   }
//
//   Future<void> setUpLocalNotification() async {
//     const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//
//     final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
//         requestAlertPermission: false,
//         requestBadgePermission: false,
//         requestSoundPermission: false,
//         onDidReceiveLocalNotification: (
//           int id,
//           String? title,
//           String? body,
//           String? payload,
//         ) async {
//           _didReceiveLocalNotificationSubject.add(
//             ReceivedNotification(
//               id: id,
//               title: title,
//               body: body,
//               payload: payload,
//             ),
//           );
//         });
//
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) => selectNotification(payload));
//     print("flutterLocalNotificationsPlugin Complete");
//   }
//
//   Future selectNotification(String? payload) async {
//     if (payload != null && payload.isNotEmpty) {
//       print('selectNotificationSubject: $payload');
//       _selectNotificationSubject.add(payload);
//     }
//   }
//
//   void iOSPermission(firebaseMessaging) {
//     firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   void _showLocalNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//
//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'your channel id', 'your channel name',
//         channelDescription: 'your channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker');
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(0, notification!.title, notification.body, platformChannelSpecifics,
//         payload: 'item x');
//
//     // AndroidNotification? android = message.notification?.android;
//     // flutterLocalNotificationsPlugin.show(
//     //   notification.hashCode,
//     //   notification!.title,
//     //   notification.body,
//     //   NotificationDetails(
//     //     android: AndroidNotificationDetails(
//     //       channel.id,
//     //       channel.name,
//     //       // channel.description,
//     //       // TODO add a proper drawable resource to android, for now using
//     //       //      one that already exists in example app.
//     //       icon: 'launch_background',
//     //     ),
//     //   ),
//     // );
//   }
//
//   void localNotificationRequestPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   void configureDidReceiveLocalNotificationSubject() {
//     print('configureDidReceiveLocalNotificationSubject stream listen"');
//     didReceiveLocalNotificationStream.listen((ReceivedNotification receivedNotification) async {
//       print("payloadNotification: $receivedNotification");
//       notificationToNavigate();
//     });
//   }
//
//   void configureSelectNotificationSubject() {
//     print("configureSelectNotificationSubject stream listen");
//     selectNotificationStream.listen((String? payload) {
//       print("payloadNotification: $payload");
//       notificationToNavigate();
//     });
//   }
//
//   void notificationToNavigate() {
//     // Navigation.pushNamed(Routes.);
//   }
//
//   void localNotificationDispose() {
//     _didReceiveLocalNotificationSubject.close();
//     _selectNotificationSubject.close();
//   }
// }
//
// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });
//
//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }
