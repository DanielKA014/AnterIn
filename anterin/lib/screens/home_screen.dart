import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('Ini adalah Home Screen')),
      // body: SafeArea(
      //   child: ElevatedButton(onPressed: onPressed, child: child),
      // ),
    );
  }
}
