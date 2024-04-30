import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/router.dart';
import 'features/bloc_playground/bloc_playground_page.dart';

void main() {
  AppRouterConfig.instance;

  // TODO: use centalized bloc observer

  // Bloc.observer = const CounterObserver();

  // final todosRepository = TodosRepository(todosApi: todosApi);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // final TodosRepository todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: "",
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterConfig.router,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
