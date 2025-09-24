import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'login-screens/logo_start.dart';
=======
import 'login-screens/start.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
      theme: ThemeData(primarySwatch: Colors.green),
=======
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
>>>>>>> Stashed changes
      home: const StartPage(),
    );
  }
}
