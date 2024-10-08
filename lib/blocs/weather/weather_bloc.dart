import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/locator.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';

import '../../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
      if(event is FetchWeatherEvent){
        emit(WeatherLoadingState());
        try {
          final Weather fetchWeather = await weatherRepository.getWeather(event.cityName);
          final Result fetchLocation = await weatherRepository.getLocation(event.cityName);
          emit(WeatherLoadedState(weather: fetchWeather, location: fetchLocation));
        } catch (e) {
          emit(WeatherErrorState());
        }
      } 
      else if(event is RefreshWeatherEvent){
        emit(WeatherLoadingState());
        try {
          final Weather fetchWeather = await weatherRepository.getWeather(event.cityName);
          final Result fetchLocation = await weatherRepository.getLocation(event.cityName);
          emit(WeatherLoadedState(weather: fetchWeather, location: fetchLocation));
        } catch (e) {
          emit(WeatherErrorState());
        }
      } 
    });
  }

  
  

}
