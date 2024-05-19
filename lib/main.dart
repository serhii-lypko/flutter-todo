import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/router.dart';

import 'app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouterConfig.instance;

  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}

class App extends MaterialApp {
  const App({super.key}) : super(home: const AppView());
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterConfig.router,
    );
  }
}
