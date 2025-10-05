import 'package:anterin/routes/activity_routes.dart';
import 'package:anterin/routes/auth_routes.dart';
import 'package:anterin/routes/chat_routes.dart';
import 'package:anterin/routes/finance_routes.dart';
import 'package:anterin/routes/home_routes.dart';
import 'package:anterin/routes/profile_routes.dart';
import 'package:anterin/routes/ride_delivery_routes.dart';
import 'package:anterin/screens/telepon_screen.dart';
import 'package:anterin/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/tab_bar_service.dart';

// RETURN SCREEN DI SINI
class MainRoutes {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter mainRouter() {
    final List<RouteBase> shellRoutes = [
      ...authRoutes(_shellNavigatorKey),
      ...homeRoutes(_shellNavigatorKey),
      ...financeRoutes(_shellNavigatorKey),
      ...rideDeliveryRoutes(_shellNavigatorKey),
      ...activityRoutes(_shellNavigatorKey),
      ...profileRoutes(_shellNavigatorKey),
      ...chatRoutes(_shellNavigatorKey),
    ];
    final mainRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/message',
          name: 'message',
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final driverName = extra?['driverName'] ?? 'Driver';
            return NoTransitionPage(
              child: MessageScreen(driverName: driverName, initialMessages: []),
            );
          },
        ),
        GoRoute(
          path: '/telepon',
          name: 'telepon',
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final driverName = extra?['driverName'] ?? 'Driver';
            return NoTransitionPage(
              child: TeleponScreen(driverName: driverName),
            );
          },
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            final location = state.uri.toString();
            return TabBarService(location: location, child: child);
          },
          routes: shellRoutes,
        ),
      ],
    );
    return mainRouter;
  }
}
