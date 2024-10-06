part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final Weather weather;
  final Result location;
  const WeatherLoadedState({required this.weather, required this.location});

  @override
  List<Object> get props => [weather, location];
}

final class WeatherErrorState extends WeatherState {}
