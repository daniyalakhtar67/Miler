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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          // this container now fills the Scaffold's full space
          // because Scaffold.body gives it tight/bounded constraints
        ),
      ),
    );
  }
}