import 'package:anterin/screens/login-screens/login.dart';
import 'package:anterin/screens/login-screens/mobile_number.dart';
import 'package:anterin/screens/login-screens/new_pass.dart';
import 'package:anterin/screens/login-screens/otp.dart';
import 'package:anterin/screens/login-screens/register.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> authRoutes(GlobalKey<NavigatorState> shellNavigatorKey) {
  return [
    GoRoute(
      path: '/',
      name: 'login',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/mobile-number',
      name: 'mobile-number',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MobileNumberPage()),
      routes: [
        GoRoute(
          path: 'otp',
          name: 'otp',
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: OtpPage()),
          routes: [
            GoRoute(
              path: 'new-pass',
              name: 'new-pass',
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: NewPassPage()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: RegisterPage()),
    ),
  ];
}
