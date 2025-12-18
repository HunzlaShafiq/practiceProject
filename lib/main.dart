import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:practice_project/Models/students_model/students_model.dart';
import 'package:practice_project/Views/main_page.dart';
import 'package:practice_project/Views/notes_app_view.dart';
import 'package:practice_project/Views/profile_View.dart';
import 'package:practice_project/services/firebase_notification_services.dart';

import 'firebase_options.dart';



void main() async{

  // initialize flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  //create path in local device
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  //initialize hive
   Hive.init(appDocumentsDir.path);

   //register adapter
  Hive.registerAdapter(StudentsModelAdapter());
  //open box or collection
  await Hive.openBox<StudentsModel>('students');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(backgroundNotificationHandle);




  runApp(const MyApp());

}

@pragma('vm:entry-point')
Future<void> backgroundNotificationHandle(RemoteMessage message) async{
  await Firebase.initializeApp();
  if (kDebugMode) {
    print(message.notification!.title.toString());
  }

  await FirebaseNotificationServices().showNotification(message);
}



class MyApp extends StatelessWidget {


  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      debugShowCheckedModeBanner: false,
      home:MainPage(),
    );
  }
}

