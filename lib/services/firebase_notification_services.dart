import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:practice_project/Views/notification_view.dart';

class FirebaseNotificationServices{


  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> getNotificationPermission() async{

    NotificationSettings notificationPermission= await messaging.requestPermission(
      alert: true,
      sound: true,
      provisional: true,
      badge: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true);

    if(notificationPermission.authorizationStatus== AuthorizationStatus.authorized){
      if (kDebugMode) {
        print('Permission Granted by User.');
      }
    }
    else if(notificationPermission.authorizationStatus==AuthorizationStatus.provisional){
      if (kDebugMode) {
        print("Permission provisional by User.");
      }
    }
    else
      {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      }



  }

  Future<String> getFirebaseToken()async{

    String? token = await messaging.getToken();

    print(token!);

    return token;




  }

  void initLocalNotification(BuildContext context,RemoteMessage message) async{

    final AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosInitializationSettings =DarwinInitializationSettings();

    InitializationSettings initializationSettings =InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload){
          handleOnClickNotification(context, message);
        },

    );


  }

  Future<void>  showNotification(RemoteMessage message) async{

    AndroidNotificationChannel androidNotificationChannel =AndroidNotificationChannel(
        'high_importance_channel',
        "High Importance Notification",
      importance: Importance.max
    );

    AndroidNotificationDetails androidNotificationDetails =AndroidNotificationDetails(
        androidNotificationChannel.id,
        androidNotificationChannel.name,
        priority: Priority.high,
        importance: Importance.high,
        ticker: 'ticker'
    );

    DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails);

    Future.delayed(Duration.zero,(){
      _flutterLocalNotificationsPlugin.show(
          Random.secure().nextInt(10000),
          message.notification!.title,
          message.notification!.body,
          notificationDetails);
    });

  }

  Future<void> initFirebaseNotification(context) async{
    FirebaseMessaging.onMessage.listen((message){

      if(Platform.isAndroid){
        initLocalNotification(context, message);
      showNotification(message);
      }else{
        showNotification(message);
      }


    });



  }

  void handleOnClickNotification(BuildContext context, RemoteMessage message){

    if(message.data['type']=='message'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
    }

  }

  Future<void> setupInteractMessage(context) async{

    //handle when app is killed
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage!.toString().isNotEmpty){
      handleOnClickNotification(context, initialMessage);
    }

    //handle when is open but in background

    FirebaseMessaging.onMessageOpenedApp.listen((message){

      handleOnClickNotification(context, message);
    });

  }

}