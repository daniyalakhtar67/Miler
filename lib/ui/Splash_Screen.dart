import 'dart:async';
import 'package:flutter/material.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/widgets/colors.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.background, // base color
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.2,
                  center: const Alignment(-0.6, -0.6),
                  colors: [
                    AppColors.blueGlow.withOpacity(0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          RichText(text: TextSpan(
            children: [
              TextSpan(text: 'WELCOME TO MILER', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
              TextSpan(text: 'THE FUTURE OF DEVELOPMENT',style: TextStyle(fontSize: 20, color: Colors.white)),
            ]
          ))
        ],
      ),
    );
  }
}