import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather/weather_bloc.dart';

class MaxAndMinTemperatureWidget extends StatelessWidget {
  const MaxAndMinTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Maximum : ' + (state as WeatherLoadedState).weather.daily!.temperature2mMax![0].floor().toString() + '°C',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Minimum : ' + (state as WeatherLoadedState).weather.daily!.temperature2mMin![0].floor().toString() + '°C',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
