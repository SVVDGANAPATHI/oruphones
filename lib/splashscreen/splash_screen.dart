import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Move to MainScreen after 3 seconds
    setuser();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/homescreen');
    });
  }

  void setuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isuser', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/Splash.json'),
      ),
    );
  }
}
