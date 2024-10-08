// weather_picture_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/weather/weather_bloc.dart';
import '../data/weather_condition.dart';
import '../helper/weather_icon_helper.dart';

class WeatherPictureWidget extends StatelessWidget {
  final WeatherCondition condition;

  const WeatherPictureWidget({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) => Column(
        children: [
          Text(
            (state as WeatherLoadedState)
                .weather
                .currentWeather!
                .temperature!
                .floor()
                .toString() + '°C',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            WeatherIconHelper.getWeatherIconPath(condition),
            width: 144,
            height: 144,
          ),
        ],
      ),
    );
  }
}
