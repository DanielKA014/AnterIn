import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/tab_bar_widget.dart';
import '../widgets/app_bar_widget.dart';

class TabBarService extends StatelessWidget {
  final Widget child;
  final String location;

  const TabBarService({super.key, required this.child, required this.location});

  void _replaceScreen(BuildContext context, int index) {
    switch (index) {
      // button kiri ke kanan
      case 0:
        context.goNamed('home');
        break;
      case 1:
        context.goNamed('activity');
        break;
      case 2:
        context.goNamed('chat');
        break;
      case 3:
        context.goNamed('profile');
        break;
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
    final List<String> screenWithNavBar = [
      '/home',
      '/activity',
      '/chat',
      '/profile',
    ];
    if (screenWithNavBar.contains(location)) {
      return Scaffold(
        appBar: AppBarWidget(),
        body: this.child,
        bottomNavigationBar: TabBarWidget(
          tappedButton: (index) => _replaceScreen(context, index),
          currentIndex: _calculateIndex(context),
        ),
      );
    }
    return Scaffold(body: this.child);
  }
}
