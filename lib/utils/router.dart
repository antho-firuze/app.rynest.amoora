import 'package:amoora/features/user/views/home/home_view.dart';
import 'package:amoora/features/user/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora/common/views/splash_view.dart';
import 'package:amoora/common/views/walkthrough_view.dart';
import 'package:amoora/features/message/views/message_detail_view.dart';
import 'package:amoora/utils/router_dashboard.dart';

// Private Navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _messageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'message');
final _alertNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'alert');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouterProvider = Provider<GoRouter>((ref) => router);

final GoRouter router = GoRouter(
  initialLocation: SplashView.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => RouterDashboard(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomeView(),
              ),
            )
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: _messageNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: MessageView.routeName,
        //       pageBuilder: (context, state) => NoTransitionPage(
        //         key: state.pageKey,
        //         child: const MessageView(),
        //       ),
        //     )
        //   ],
        // ),
        // Dummy Page on Center
        StatefulShellBranch(
          // navigatorKey: _alertNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: Container(),
              ),
            )
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: _alertNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: NotificationView.routeName,
        //       pageBuilder: (context, state) => NoTransitionPage(
        //         key: state.pageKey,
        //         child: const NotificationView(),
        //       ),
        //     )
        //   ],
        // ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfileView(),
              ),
            )
          ],
        ),
      ],
    ),
    // COMMON PAGES
    GoRoute(
      path: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: WalkthroughView.routeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const WalkthroughView(),
    ),

    // CHAT PAGES
    GoRoute(
      path: MessageDetailView.routeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        var args = state.extra as Map<String, dynamic>;
        return MessageDetailView(
          title: args['title'],
        );
      },
    ),
  ],
);
