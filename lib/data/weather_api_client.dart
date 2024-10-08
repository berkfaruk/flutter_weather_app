import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/location.dart';
import '../models/weather.dart';

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class WeatherApiClient {

  final http.Client httpClient = http.Client();

  static const _baseUrlWeather = 'api.open-meteo.com';
  static const _baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  Future<Result> locationSearch(String cityName) async {
  final locationRequest = Uri.https(
    _baseUrlGeocoding,
    '/v1/search',
    {'name': cityName, 'count': '1'},
  );

  final locationResponse = await httpClient.get(locationRequest);

  if (locationResponse.statusCode != 200) {
    throw LocationRequestFailure();
  }

  final locationJson = jsonDecode(locationResponse.body) as Map<String, dynamic>;

  if (!locationJson.containsKey('results')) throw LocationNotFoundFailure();

  final results = locationJson['results'] as List;

  if (results.isEmpty) throw LocationNotFoundFailure();

  return Result.fromJson(results.first as Map<String, dynamic>);
}

  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherRequest = Uri.https(_baseUrlWeather, 'v1/forecast', {
  'latitude': '$latitude',
  'longitude': '$longitude',
  'current_weather': 'true',
  'daily': 'temperature_2m_max,temperature_2m_min',
  'timezone': 'auto'
});

    final weatherResponse = await httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    return Weather.fromJson(bodyJson);
  }


}
