import 'package:anterin/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> profileRoutes(GlobalKey<NavigatorState> shellNavigatorKey) {
  return [
    GoRoute(
      path: '/profile',
      name: 'profile',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ProfilePage()),
    ),
  ];
}
