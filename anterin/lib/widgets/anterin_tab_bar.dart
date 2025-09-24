import 'package:anterin/screens/home_screen.dart';
import 'package:flutter/material.dart';

// stateful karena menggunakan animasi
class AnterinTabBar extends StatefulWidget {
  const AnterinTabBar({super.key});

  @override
  State<AnterinTabBar> createState() => _AnterinTabBarState();
}

class _AnterinTabBarState extends State<AnterinTabBar> {
  int _selectedIndex = 0;

  Future<Widget> _getWidget(int index) async {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        // aktivitas
        return Placeholder();
      case 2:
        // chat
        return Placeholder();
      case 3:
        // profil
        return Placeholder();
      default:
        return HomeScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<Widget>(
            future: _getWidget(_selectedIndex),
            builder: (context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Center(child: snapshot.data);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error occured!'));
              }
              return Center(child: Text('No data'));
            },
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'Chat',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
        ),
      ],
    );
  }
}
