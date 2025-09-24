import 'package:flutter/material.dart';
import 'login-screens/start.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anterin/routes/main_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anterin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StartPage(),
    );
  }
}
