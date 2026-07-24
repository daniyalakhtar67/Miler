import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:isar_community/isar.dart';
import 'package:running_app/core_files/active_run.dart';
import 'package:running_app/core_files/profile.dart';
import 'package:running_app/core_files/summary.dart';
import 'package:running_app/widgets/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}
Widget _blog(double size, Color color){
  return ImageFiltered(imageFilter: ImageFilter.blur(sigmaY: 80, sigmaX: 80),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}
class _DashboardState extends State<Dashboard> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: AppColors.backgroundDark)),
          Positioned.fill(top: -50, bottom: -50 ,child: _blog(200, AppColors.new1)),
          Positioned.fill(top: 100, bottom: -60, child: _blog(200, AppColors.new2)),
          Positioned.fill(top: -60, bottom: 60, child: _blog(200, AppColors.new3)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Summary()));
                  }, icon: Icon(Icons.radar_sharp,color: Colors.white,size: 40,)),

                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveRun()));
                  }, icon: 
                  Icon(Icons.directions_run, color: Colors.white,size: 40,)),

                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                  }, icon: Icon(Icons.person,color: Colors.white,size: 40,))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
