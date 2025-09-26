import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 130, 255, 161),
      foregroundColor: Colors.white,
      title: Image.asset(
        'assets/images/anterin-logo-horizontal.png',
        fit: BoxFit.contain,
        height: 72.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
