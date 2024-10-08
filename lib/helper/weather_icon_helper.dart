// weather_icon_helper.dart
import '../data/weather_condition.dart';

class WeatherIconHelper {
  static String getWeatherIconPath(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
        return 'assets/icons/clear.png';
      case WeatherCondition.cloudy:
        return 'assets/icons/cloudy.png';
      case WeatherCondition.rainy:
        return 'assets/icons/rainy.png';
      case WeatherCondition.snowy:
        return 'assets/icons/snowy.png';
      default:
        return 'assets/icons/unknown.png';
    }
  }
}

