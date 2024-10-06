// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/blocs/weather/weather_bloc.dart';
import 'package:flutter_weather_app/widgets/choose_city.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temperature.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String userChoosenCity = 'Ankara';

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
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
              
              print(fetchWeather.currentWeather?.temperature);
              print(fetchWeather.elevation);
              print(fetchWeather.currentWeather?.weathercode);
              print(fetchWeather.daily!.temperature2mMin);
              print(fetchWeather.daily!.temperature2mMin![0]);
              print(fetchWeather.daily!.temperature2mMax);
              print(fetchLocation.name);
              

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: LocationWidget(
                      choosenCity: userChoosenCity,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: LastUpdateWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: WeatherPictureWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: MaxAndMinTemperatureWidget()),
                  ),
                ],
              );
            }
            if (state is WeatherErrorState) {
              return Center(child: Text('Error'));
            } else return Center();
          },
        ),
      ),
    );
  }
}
