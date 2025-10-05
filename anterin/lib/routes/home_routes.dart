import 'package:anterin/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> homeRoutes(GlobalKey<NavigatorState> shellNavigatorKey) {
  return [
    GoRoute(
      path: '/home',
      name: 'home',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomeScreen()),
    ),
  ];
}
