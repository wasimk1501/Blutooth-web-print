import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/doctor_screen.dart';
import 'package:md_calculator/pages/home_page.dart';
import 'package:md_calculator/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/bmiIcon.png",
            width: 60,
          ),
          Text(
            "General App",
            style:
                GoogleFonts.aBeeZee(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }

  void navigateScreen() {
    Timer(const Duration(seconds: 3), () {
      bool isDoctorLogin = loginBox.get("isDoctorLogin", defaultValue: false);
      bool isEmployeeLogin =
          loginBox.get("isEmployeeLogin", defaultValue: false);
      if (isEmployeeLogin && isDoctorLogin) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else if (isEmployeeLogin) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DoctorScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }
}
