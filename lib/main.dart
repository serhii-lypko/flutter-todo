import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/router.dart';

import 'app_bloc_observer.dart';

import 'packages/repository/repository.dart';
import 'packages/data_provider/database_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouterConfig.instance;

  Bloc.observer = const AppBlocObserver();

  final objectBoxStore = await ObjectBox.create();
  final databaseProvider = DatabaseProvider(objectBoxStore: objectBoxStore);

  // TODO: how would I set up more then 1 repository? 🤔
  final repository = WordPairsRepository(persistenceApi: databaseProvider);

  runApp(App(repository: repository));
}

class App extends StatelessWidget {
  const App({required this.repository, super.key});

  final WordPairsRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
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
