// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/choose_city.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temperature.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String userChoosenCity= 'Ankara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async{
              userChoosenCity = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChooseCityWidget(),
              ));
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(choosenCity: userChoosenCity,)),
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
        ),
      ),
    );
  }
}
