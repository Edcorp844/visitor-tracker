import 'package:firebase_core/firebase_core.dart';
import 'package:visitortracker/Handlers/telegrambot.dart';
import 'package:visitortracker/controllers/others/login_page_controller.dart';
import 'package:visitortracker/controllers/others/mainpage_controller.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:visitortracker/controllers/core/tab_controller.dart';

//main
void main() async {
  telegram();
  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp1());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabBarController(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
    );
  }
}
