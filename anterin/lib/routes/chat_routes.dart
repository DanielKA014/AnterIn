import 'package:anterin/screens/chat_screen.dart';
import 'package:anterin/screens/message_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> chatRoutes(GlobalKey<NavigatorState> shellNavigatorKey) {
  return [
    GoRoute(
      path: '/chat-list',
      name: 'chat-list',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ChatListScreen()),
    ),
    GoRoute(
      path: '/chat-detail',
      name: 'chat-detail',
      parentNavigatorKey: shellNavigatorKey,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final driverName = extra['driverName'] as String;
        final initialMessages =
            extra['initialMessages'] as List<Map<String, String>>;
        return NoTransitionPage(
          child: MessageScreen(
            driverName: driverName,
            initialMessages: initialMessages,
          ),
        );
      },
    ),
  ];
}
