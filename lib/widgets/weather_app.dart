// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/theme/theme_bloc.dart';
import 'package:flutter_weather_app/blocs/weather/weather_bloc.dart';
import 'package:flutter_weather_app/data/weather_condition.dart';
import 'package:flutter_weather_app/widgets/choose_city.dart';
import 'package:flutter_weather_app/widgets/gradient_background_color.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temperature.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String userChoosenCity = 'Ankara';
  Completer _refreshCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              userChoosenCity =
                  await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChooseCityWidget(),
              ));
              if (userChoosenCity.isNotEmpty) {
                _weatherBloc.add(FetchWeatherEvent(cityName: userChoosenCity));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return Center(child: Text('Choose City'));
            }
            if (state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadedState) {

              final fetchWeather = state.weather;
              final fetchLocation = state.location;
              BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(fetchWeather.currentWeather!.weathercode!));
              userChoosenCity = fetchLocation.name!;

              return BlocBuilder(
                bloc: BlocProvider.of<ThemeBloc>(context),
                builder: (context, state) => GradientBackgroundColor(
                  color: (state as AppThemeState).color,
                  child: RefreshIndicator(
                    onRefresh: () {
                      _weatherBloc.add(RefreshWeatherEvent(cityName: userChoosenCity));
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: LocationWidget(
                            choosenCity: fetchLocation.name!,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: LastUpdateWidget()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: WeatherPictureWidget(condition: fetchWeather.currentWeather!.weathercode!.toCondition)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: MaxAndMinTemperatureWidget()),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is WeatherErrorState) {
              return Center(child: Text('Something Went Wrong'));
            } else return Center();
          },
        ),
      ),
    );
  }
}
