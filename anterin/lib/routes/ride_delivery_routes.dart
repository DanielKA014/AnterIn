import 'package:anterin/screens/ride-car-screen/ride_input_screen_car.dart';
import 'package:anterin/screens/ride-car-screen/ride_map_screen_car.dart';
import 'package:anterin/screens/ride-delivery-screen/ride_input_delivery_screen.dart';
import 'package:anterin/screens/ride-delivery-screen/ride_map_delivery_screen.dart';
import 'package:anterin/screens/ride-motor-screen/ride_input_screen.dart';
import 'package:anterin/screens/ride-motor-screen/ride_map_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> rideDeliveryRoutes(
  GlobalKey<NavigatorState> shellNavigatorKey,
) {
  return [
    GoRoute(
      path: '/home/motorcycle',
      name: 'motorcycle',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: RideInputScreen());
      },
      routes: [
        GoRoute(
          path: 'map',
          name: 'motorcycle-map',
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, String>?;
            final from = extra?['from'] ?? 'Unknown From';
            final to = extra?['to'] ?? 'Unknown To';
            return NoTransitionPage(
              child: RideMapScreenMotor(from: from, to: to),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home/car',
      name: 'car',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: RideInputScreenCar());
      },
      routes: [
        GoRoute(
          path: 'map',
          name: 'car-map',
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, String>?;
            final from = extra?['from'] ?? 'Unknown From';
            final to = extra?['to'] ?? 'Unknown To';
            return NoTransitionPage(
              child: RideMapScreenCar(from: from, to: to),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home/delivery',
      name: 'delivery',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: RideDeliveryScreen());
      },
      routes: [
        GoRoute(
          path: 'map',
          name: 'delivery-map',
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final from = extra?['from'] ?? 'Unknown From';
            final to = extra?['to'] ?? 'Unknown To';
            final weight = extra?['weight'] ?? 'N/A';
            final itemType = extra?['itemType'] ?? 'N/A';
            return NoTransitionPage(
              child: RideMapScreenDelivery(
                from: from,
                to: to,
                weight: weight,
                itemType: itemType,
              ),
            );
          },
        ),
      ],
    ),
  ];
}
