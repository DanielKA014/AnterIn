import 'package:anterin/widgets/anterin_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
//   debugLabel: 'shell',
// );

// RETURN SCREEN DI SINI
class MainRouter {
  GoRouter mainRouter() {
    final mainRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home',
      routes: [
        ShellRoute(
          // navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            final location = state.uri.toString();
            print(location);
            return AnterinTabBar(location: location, child: child);
          },
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'motorcycle',
                  name: 'motorcycle',
                  // entah kenapa parentNavigatorKey exception, padahal ngikutin blog orang
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    print(state.uri.toString());
                    return const Placeholder();
                  },
                ),
                GoRoute(
                  path: 'car',
                  name: 'car',
                  builder: (context, state) {
                    print(state.uri.toString());
                    return const Placeholder();
                  },
                ),
                GoRoute(
                  path: 'delivery',
                  name: 'delivery',
                  // entah kenapa parentNavigatorKey exception, padahal ngikutin blog orang
                  // parentNavigatorKey: _shellNavigatorKey,
                  builder: (context, state) {
                    print(state.uri.toString());
                    return const Placeholder();
                  },
                ),
              ],
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
              builder: (context, state) => const Placeholder(),
            ),
          ],
        ),
      ],
    );
    return mainRouter;
  }
}
