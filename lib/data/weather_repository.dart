import 'package:flutter_weather_app/models/location.dart';

import '../locator.dart';
import '../models/weather.dart';
import 'weather_api_client.dart';

class WeatherRepository {

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async{
    
    final location = await weatherApiClient.locationSearch(city);
    final weather = await weatherApiClient.getWeather(latitude: location.latitude!, longitude: location.longitude!);

    return weather;
  }
  Future<Result> getLocation(String city) async{
    
    final location = await weatherApiClient.locationSearch(city);

    return location;
  }

}