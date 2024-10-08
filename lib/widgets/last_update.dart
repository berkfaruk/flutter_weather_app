import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/weather/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        var newDate = (state as WeatherLoadedState).weather.currentWeather?.time;
        var parsedDate = DateTime.parse(newDate!);
        return Text(
        'Last Update : ' + TimeOfDay.fromDateTime(parsedDate.toLocal()).format(context),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      );
      },
    );
  }
}
