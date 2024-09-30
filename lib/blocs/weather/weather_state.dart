part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;
  const WeatherLoadedState({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class WeatherErrorState extends WeatherState {}
