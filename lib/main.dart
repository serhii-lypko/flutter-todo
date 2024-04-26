import 'package:flutter/material.dart';

import 'router/router.dart';

void main() {
  AppRouterConfig.instance;

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterConfig.router,
    );
  }
}
