import 'package:anterin/widgets/anterin_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter mainRouter() {
  final mainRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          final location = state.uri.toString();
          return AnterinTabBar(location: location, child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/activity',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: '/chat',
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
    ],
  );
  return mainRouter;
}
