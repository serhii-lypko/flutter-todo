import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'router/router.dart';
import 'app_bloc_observer.dart';
import 'package:wise_repeat/shared/bloc/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

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
    return BlocProvider(
        create: (_) => SettingsCubit(),
        child: BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouterConfig.router,
            theme: state.themeOption.toThemeData(context),
          );
        }));
  }
}
