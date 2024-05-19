import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ThemeOption { system, dark, light }

extension ThemeOptionExt on ThemeOption {
  static ThemeOption fromString(String value) {
    return ThemeOption.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => ThemeOption.system,
    );
  }

  String toReadableString() {
    switch (this) {
      case ThemeOption.dark:
        return "Dark";
      case ThemeOption.light:
        return "Light";
      case ThemeOption.system:
        return "System";
      default:
        return "System";
    }
  }

  toThemeData(BuildContext context) {
    switch (this) {
      case ThemeOption.dark:
        return ThemeData.dark();
      case ThemeOption.light:
        return ThemeData.light();
      case ThemeOption.system:
        var brightness = MediaQuery.of(context).platformBrightness;
        return brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
      default:
        return ThemeData();
    }
  }
}

enum FontSizeOption { sm, md, lg }

extension FontSizeOptionExt on FontSizeOption {
  //
}

class SettingsState {
  SettingsState({required this.themeOption, required this.fontSize});

  final ThemeOption themeOption;
  final int fontSize; // TODO: use FontSizeOption
}

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState(themeOption: ThemeOption.system, fontSize: 14));

  void setTheme(ThemeOption variant) {
    emit(SettingsState(themeOption: variant, fontSize: state.fontSize));
  }

  void setFontSize(int fontSize) {
    emit(SettingsState(themeOption: state.themeOption, fontSize: fontSize));
  }

  @override
  SettingsState fromJson(Map<String, dynamic> json) {
    return SettingsState(
      themeOption: json['themeOption'] != null
          ? ThemeOptionExt.fromString(json['themeOption'])
          : ThemeOption.system,
      fontSize: json['fontSize'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson(SettingsState state) {
    return {
      'themeOption': state.themeOption.toString(),
      'fontSize': state.fontSize,
    };
  }
}
