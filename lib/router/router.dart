import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wise_repeat/pages/exports.dart';

class AppRouterConfig {
  static AppRouterConfig get instance => _instance;
  static final AppRouterConfig _instance = AppRouterConfig._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  AppRouterConfig._internal() {
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: HomePage.routeName,
      routes: [
        GoRoute(
          path: HomePage.routeName,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const HomePage(),
              state: state,
            );
          },
        ),
        GoRoute(
          path: SettingsPage.routeName,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const SettingsPage(),
              state: state,
            );
          },
        ),
      ],
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
