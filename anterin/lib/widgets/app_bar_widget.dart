import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isNested;
  const AppBarWidget({super.key, required this.isNested});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (isNested)
          ? IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            )
          : null,
      title: Image.asset(
        'assets/images/anterin-logo-horizontal.png',
        fit: BoxFit.contain,
        height: 72.0,
      ),
      shadowColor: const Color.fromARGB(81, 0, 0, 0),
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
