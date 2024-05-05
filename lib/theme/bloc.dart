import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// TODO: would that make sense to implement with cubit?

class ThemeState extends Equatable {
  final ThemeData themeData;

  ThemeState({ThemeData? themeData})
      : themeData = themeData ?? ThemeData.dark();

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [themeData];
}

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeToggled extends ThemeEvent {
  const ThemeToggled();
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ThemeToggled>(_themeToggled);
  }

  void _themeToggled(
    ThemeToggled event,
    Emitter<ThemeState> emit,
  ) {
    print("Theme toggled");

    // Toggle between light and dark theme
    emit(state.copyWith(
      themeData: state.themeData.brightness == Brightness.dark
          ? ThemeData.light()
          : ThemeData.dark(),
    ));
  }
}
