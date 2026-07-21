import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:running_app/ui/login.dart';
import 'package:running_app/widgets/colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = true;
  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    email.dispose();
    pass.dispose();
  }
  Widget _blog(double size, Color color){
    return ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
    child: Container(
        height: size,
        width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
      //   ),
      //
      // ),
        body: Stack(
          children: [
            Positioned.fill(child: Container(color: AppColors.backgroundDark)),
            Positioned(top: -50, bottom: -50, child: _blog(200, AppColors.new1)),
            Positioned(top: 100, bottom: -60, child: _blog(220, AppColors.new2)),
            Positioned(top:-60, bottom: 60, child: _blog(200, AppColors.new3)),
          ],
        ),
    );
  }
}
