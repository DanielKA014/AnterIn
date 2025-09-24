import 'package:flutter/material.dart';

class AnterinAppBar extends StatelessWidget {
  const AnterinAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/anterin-logo-horizontal.png',
        fit: BoxFit.contain,
        height: 96.0,
      ),
    );
  }
}
