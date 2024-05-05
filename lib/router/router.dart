import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: cenralized routes export from the featurs

// TODO: improve routing organization
import '../features/settings/settings_page.dart';
import '../features/word_pairs_overview/word_pairs_overview_page.dart';

class AppRouterConfig {
  static AppRouterConfig get instance => _instance;
  static final AppRouterConfig _instance = AppRouterConfig._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouterConfig._internal() {
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: WordPairsOverviewPage.routeName,
      routes: [
        GoRoute(
          path: WordPairsOverviewPage.routeName,
          pageBuilder: (context, GoRouterState state) {
            return getPage(
              child: const WordPairsOverviewPage(),
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
