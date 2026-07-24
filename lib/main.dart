import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:running_app/core_files/dashboard.dart';
import 'package:running_app/database/isar/todo.dart';
import 'package:running_app/ui/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([TodoSchema], directory: dir.path);

  runApp(
    Provider<Isar>.value(
      value: isar,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}