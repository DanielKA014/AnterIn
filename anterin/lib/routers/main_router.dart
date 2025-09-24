import 'package:anterin/widgets/anterin_tab_bar.dart';
import 'package:go_router/go_router.dart';

GoRouter mainRouter() {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => AnterinTabBar(),
      ),
    ],
  );
  return router;
}
