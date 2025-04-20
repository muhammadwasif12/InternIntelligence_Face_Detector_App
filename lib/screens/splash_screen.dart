import 'dart:async';
import 'package:flutter/material.dart';
import 'package:face_detection_app/screens/face_detection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const FaceDetectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash image
            Image.asset(
              "assets/images/splash image.png",
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
