import 'dart:async';
import 'package:education_app/splash.dart';
import 'package:education_app/startpage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0Xff666d73), // navigation bar color
      statusBarColor: Color(0Xff666d73),
      statusBarIconBrightness: Brightness.light, // status bar color
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF666d73),
        textTheme: TextTheme(
            headlineMedium: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff232426),
        ),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
