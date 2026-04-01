import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

/// BLoC for managing app theme (light/dark mode)
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ToggleTheme>(_onToggleTheme);
    on<SetThemeMode>(_onSetThemeMode);
  }

  void _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) {
    final newMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(state.copyWith(themeMode: newMode));
  }

  void _onSetThemeMode(
    SetThemeMode event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(themeMode: event.mode));
  }
}
