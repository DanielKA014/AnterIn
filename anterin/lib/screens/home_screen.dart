import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/anterin-logo-horizontal.png',
          fit: BoxFit.contain,
          height: 96.0,
        ),
      ),
      body: Center(child: Text('Ini adalah Home Screen')),
    );
  }
}
