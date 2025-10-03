import 'package:anterin/screens/history_screen.dart';
import 'package:anterin/screens/login-screens/login.dart';
import 'package:anterin/screens/login-screens/mobile_number.dart';
import 'package:anterin/screens/login-screens/new_pass.dart';
import 'package:anterin/screens/login-screens/otp.dart';
import 'package:anterin/screens/login-screens/register.dart';
import 'package:anterin/screens/ride-motor-screen/ride_input_screen.dart';
import 'package:anterin/screens/ride-motor-screen/ride_map_screen.dart';
import 'package:anterin/screens/ride-car-screen/ride_input_screen_car.dart';
import 'package:anterin/screens/ride-car-screen/ride_map_screen_car.dart';
import 'package:anterin/screens/telepon_screen.dart';
import 'package:anterin/screens/message_screen.dart';
import 'package:anterin/screens/top_up_payment_screen.dart';
import 'package:anterin/screens/top_up_screen.dart';
import 'package:anterin/screens/top_up_success_screen.dart';
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
        GoRoute(
          path: '/message',
          name: 'message',
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final driverName = extra?['driverName'] ?? 'Driver';
            return NoTransitionPage(child: ChatScreen(driverName: driverName));
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
            print(location);
            return TabBarService(location: location, child: child);
          },
          routes: [
            GoRoute(
              path: '/',
              name: 'login',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: LoginPage()),
            ),
            GoRoute(
              path: '/mobile-number',
              name: 'mobile-number',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MobileNumberPage()),
              routes: [
                GoRoute(
                  path: 'otp',
                  name: 'otp',
                  parentNavigatorKey: _shellNavigatorKey,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: OtpPage()),
                  routes: [
                    GoRoute(
                      path: 'new-pass',
                      name: 'new-pass',
                      parentNavigatorKey: _shellNavigatorKey,
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
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: RegisterPage()),
            ),
            GoRoute(
              path: '/home',
              name: 'home',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
            ),
            GoRoute(
              path: '/home/motorcycle',
              name: 'motorcycle',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                print(state.uri.toString());
                return NoTransitionPage(child: RideInputScreen());
              },
              routes: [
                GoRoute(
                  path: 'map',
                  name: 'map',
                  parentNavigatorKey: _shellNavigatorKey,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, String>?;
                    final from = extra?['from'] ?? 'Unknown From';
                    final to = extra?['to'] ?? 'Unknown To';
                    print(state.uri.toString());
                    return NoTransitionPage(
                      child: RideMapScreenMotor(from: from, to: to),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/home/delivery',
              name: 'delivery',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                print(state.uri.toString());
                return const Placeholder();
              },
            ),
            GoRoute(
              path: '/home/top-up',
              name: 'topup',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TopUpScreen()),
              routes: [
                GoRoute(
                  path: 'payment',
                  name: 'top-up-payment',
                  parentNavigatorKey: _shellNavigatorKey,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: TopUpPaymentScreen()),
                  routes: [
                    GoRoute(
                      path: 'success',
                      name: 'top-up-success',
                      parentNavigatorKey: _shellNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: TopUpSuccessScreen()),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/home/car',
              name: 'car',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                print(state.uri.toString());
                return NoTransitionPage(child: RideInputScreenCar());
              },
              routes: [
                GoRoute(
                  path: 'map',
                  name: 'car-map',
                  parentNavigatorKey: _shellNavigatorKey,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, String>?;
                    final from = extra?['from'] ?? 'Unknown From';
                    final to = extra?['to'] ?? 'Unknown To';
                    print(state.uri.toString());
                    return NoTransitionPage(
                      child: RideMapScreenCar(from: from, to: to),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/activity',
              name: 'activity',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HistoryScreen()),
            ),
            GoRoute(
              path: '/chat',
              name: 'chat',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Placeholder()),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Placeholder()),
            ),
          ],
        ),
      ],
    );
    return mainRouter;
  }
}
