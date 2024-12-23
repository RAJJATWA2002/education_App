import 'dart:async';
import 'package:education_app/home.dart';
import 'package:education_app/loginpage.dart';
import 'package:education_app/widgets/bottomBar.dart';
import 'package:education_app/startpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    wheretogo();
  }

  static const String Keylogin = 'login';

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0Xff666d73),
      body: Container(
        height: 800,
        width: 360,
        alignment: Alignment.center,
        child: Image.asset("assets/images/edu logo 1.png"),
      ),
    );
  }

  void wheretogo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(Keylogin);

    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomBar()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Startpage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Startpage()));
      }
    });
  }
}
