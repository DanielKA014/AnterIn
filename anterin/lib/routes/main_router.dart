import 'package:anterin/screens/login-screens/login.dart';
import 'package:anterin/screens/login-screens/mobile_number.dart';
import 'package:anterin/screens/profile/profile_screen.dart';
import 'package:anterin/screens/login-screens/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../services/tab_bar_service.dart';

// RETURN SCREEN DI SINI
class MainRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter mainRouter() {
    final mainRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            final location = state.uri.toString();
            print(location);
            return TabBarService(location: location, child: child);
          },
          routes: [
            GoRoute(
              path: '/',
              name: 'login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: '/mobile-number',
              name: 'mobile-number',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const MobileNumberPage(),
            ),
            GoRoute(
              path: '/register',
              name: 'register',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const RegisterPage(),
            ),
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: '/home/motorcycle',
              name: 'motorcycle',
              // parentNavigatorKey: _rootNavigatorKey,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                print(state.uri.toString());
                return const Placeholder();
              },
            ),
            GoRoute(
              path: '/home/car',
              name: 'car',
              // parentNavigatorKey: _rootNavigatorKey,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                print(state.uri.toString());
                return const Placeholder();
              },
            ),
            GoRoute(
              path: '/home/delivery',
              name: 'delivery',
              // parentNavigatorKey: _rootNavigatorKey,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                print(state.uri.toString());
                return const Placeholder();
              },
            ),

            GoRoute(
              path: '/activity',
              name: 'activity',
              builder: (context, state) => const Placeholder(),
            ),
            GoRoute(
              path: '/chat',
              name: 'chat',
              builder: (context, state) => const Placeholder(),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    );
    return mainRouter;
  }
}
