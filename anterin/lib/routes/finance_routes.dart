import 'package:anterin/screens/top-up-screens/top_up_payment_screen.dart';
import 'package:anterin/screens/top-up-screens/top_up_screen.dart';
import 'package:anterin/screens/top-up-screens/top_up_success_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> financeRoutes(GlobalKey<NavigatorState> shellNavigatorKey) {
  return [
    GoRoute(
      path: '/home/top-up',
      name: 'topup',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: TopUpScreen()),
      routes: [
        GoRoute(
          path: 'payment',
          name: 'top-up-payment',
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TopUpPaymentScreen()),
          routes: [
            GoRoute(
              path: 'success',
              name: 'top-up-success',
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TopUpSuccessScreen()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home/pay',
      name: 'pay',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: Placeholder()),
    ),
  ];
}
