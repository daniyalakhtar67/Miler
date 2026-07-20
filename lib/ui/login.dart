import 'dart:async';
import 'package:flutter/material.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/widgets/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

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


        ],
      ),
    );
  }
}