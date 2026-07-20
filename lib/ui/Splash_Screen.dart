import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/widgets/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.2,
                  center: const Alignment(-0.6, -0.6),
                  colors: [
                    AppColors.backgroundLight,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      // borderRadius: BorderRadius.only(topLeft: 10, bottomLeft: 10)
                      image: DecorationImage(image:  AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                      )
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'WELCOME TO MILER\n',
                        style: GoogleFonts.sora(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'THE FUTURE OF DEVELOPMENT',
                        style: GoogleFonts.sora(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}