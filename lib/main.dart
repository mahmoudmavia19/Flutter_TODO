import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycourse/task_todo/login.dart';
import 'package:mycourse/utils/notifi_service.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  tz.initializeTimeZones();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white) ,
       appBarTheme: const AppBarTheme(
         titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
         foregroundColor: Colors.white
       ),
        floatingActionButtonTheme: const  FloatingActionButtonThemeData(foregroundColor:Colors.white)
      ),
      darkTheme:ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home:const LoginScreen(),
    );
  }
}
