import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/colors.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(AppThemeState(theme: ThemeData(primaryColor: Colors.transparent), color: Colors.blue)) {
    on<ThemeEvent>((event, emit) {
      AppThemeState appThemeState;
      if(event is ChangeThemeEvent){
        switch(event.weatherCode) {

        case 0:
        // Sunny
        appThemeState = AppThemeState(theme: ThemeData(primaryColor: sunnyColor1), color: getMaterialColor(sunnyColor2));
          break;
        case 1:
        case 2:
        case 3:
        case 45:
        case 48:
          // Cloudy
          appThemeState = AppThemeState(theme: ThemeData(primaryColor: cloudyColor1), color: getMaterialColor(cloudyColor2));
          break;
        case 51:
        case 53:
        case 55:
        case 61:
        case 63:
        case 65:
        case 80:
        case 81:
        case 82:
          // Rainy
          appThemeState = AppThemeState(theme: ThemeData(primaryColor: rainyColor1), color: getMaterialColor(rainyColor2));
          break;
        case 71:
        case 73:
        case 75:
        case 77:
        case 85:
        case 86:
          // Snowy
          appThemeState = AppThemeState(theme: ThemeData(primaryColor: snowyColor1), color: getMaterialColor(sunnyColor2));
          break;
        default:
          // Unknown Weather
          appThemeState = AppThemeState(theme: ThemeData(primaryColor: Colors.blue), color: Colors.blue);
          break;

        }
        emit(appThemeState);
      }
    });
  }
}
