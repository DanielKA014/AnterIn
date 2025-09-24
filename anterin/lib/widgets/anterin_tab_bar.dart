// import 'package:anterin/screens/home_screen.dart';
// import 'package:flutter/material.dart';

// // stateful karena menggunakan animasi
// class AnterinTabBar extends StatefulWidget {
//   const AnterinTabBar({super.key});

//   @override
//   State<AnterinTabBar> createState() => _AnterinTabBarState();
// }

// class _AnterinTabBarState extends State<AnterinTabBar> {
//   int _selectedIndex = 0;

//   Future<Widget> _getWidget(int index) async {
//     switch (index) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         // aktivitas
//         return Placeholder();
//       case 2:
//         // chat
//         return Placeholder();
//       case 3:
//         // profil
//         return Placeholder();
//       default:
//         return HomeScreen();
//     }
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: FutureBuilder<Widget>(
//             future: _getWidget(_selectedIndex),
//             builder: (context, AsyncSnapshot<Widget> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasData) {
//                 return Center(child: snapshot.data);
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error occured!'));
//               }
//               return Center(child: Text('No data'));
//             },
//           ),
//         ),
//         BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.history_rounded),
//               label: 'Aktivitas',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.chat_outlined),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Theme.of(context).primaryColor,
//           onTap: _onItemTapped,
//         ),
//       ],
//     );
//   }
// }

// REFACTOR
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnterinTabBar extends StatelessWidget {
  final Widget child;
  final String location;

  const AnterinTabBar({super.key, required this.child, required this.location});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/activity');
      case 2:
        context.go('/chat');
      case 3:
        context.go('/profile');
      default:
    }
  }

  int _calculateIndex(BuildContext context) {
    String endpoint = this.location;
    switch (endpoint) {
      case '/home':
        return 0;
      case '/activity':
        return 1;
      case '/chat':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

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
      body: this.child,
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _calculateIndex(context),
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
