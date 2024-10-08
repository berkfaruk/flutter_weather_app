part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int weatherCode;
  const ChangeThemeEvent(this.weatherCode);

  @override
  List<Object> get props => [weatherCode];
}
