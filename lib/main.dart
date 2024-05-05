import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/router.dart';

import 'app_bloc_observer.dart';

import 'packages/data_provider/database_provider.dart';

import 'packages/repository/word_pairs_repository.dart';
import 'packages/repository/settings_repository.dart';

// TODO
import './theme/bloc.dart';

// TODO: how to implement app init? (load theme & stuff)
// including very first time run -> setting up settings in DB etc.

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouterConfig.instance;

  Bloc.observer = const AppBlocObserver();

  final dbProvider = await ObjectBoxDBProvider.create();

  final wordPairsRepository = WordPairsRepository(dbProvider: dbProvider);
  final settingsRepository = SettingsRepository(dbProvider: dbProvider);

  runApp(App(
      wordPairsRepository: wordPairsRepository,
      settingsRepository: settingsRepository));
}

class App extends StatelessWidget {
  const App(
      {required this.wordPairsRepository,
      required this.settingsRepository,
      super.key});

  final WordPairsRepository wordPairsRepository;
  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WordPairsRepository>(
          create: (context) => wordPairsRepository,
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => settingsRepository,
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeBloc(repository: context.read<SettingsRepository>()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouterConfig.router,
            theme: state.themeData,
            // TODO
            // darkTheme: ThemeData(
            //   brightness: Brightness.dark,
            // ),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     debugShowCheckedModeBanner: false,
  //     routerConfig: AppRouterConfig.router,
  //     themeMode: ThemeMode.dark,
  //     darkTheme: ThemeData(
  //       brightness: Brightness.dark,
  //     ),
  //   );
  // }
}
