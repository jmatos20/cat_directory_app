import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Toggle between light and dark theme
class ToggleTheme extends ThemeEvent {
  const ToggleTheme();
}

/// Set theme to a specific mode
class SetThemeMode extends ThemeEvent {
  final ThemeMode mode;

  const SetThemeMode(this.mode);

  @override
  List<Object?> get props => [mode];
}
