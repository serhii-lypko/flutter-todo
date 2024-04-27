import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navigation.dart';

// TODO: improve routing organization
import '../features/todos/todos_page.dart';
import '../features/todos/add_todo_page.dart';

import '../features/settings/settings_page.dart';

class AppRouterConfig {
  static final AppRouterConfig _instance = AppRouterConfig._internal();

  static AppRouterConfig get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory AppRouterConfig() {
    return _instance;
  }

  AppRouterConfig._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: TodosPage.routeName,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const TodosPage(),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: AddTodoPage.routeName,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const AddTodoPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: SettingsPage.routeName,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const SettingsPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      )
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: TodosPage.routeName,
      routes: routes,
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
