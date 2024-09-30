import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      if(event is FetchWeatherEvent){
        emit(WeatherLoadingState());
        try {
          emit(WeatherLoadedState(weather: WeatherModel()));
        } catch (e) {
          emit(WeatherErrorState());
        }
      }
    });
  }
}
