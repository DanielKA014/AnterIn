import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) tappedButton;
  const TabBarWidget({
    super.key,
    required this.tappedButton,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_rounded),
          label: 'Aktivitas',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
      currentIndex: currentIndex,
      onTap: tappedButton,
    );
  }
}
