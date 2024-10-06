import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    double? latitude;
    double? longitude;
    double? generationtimeMs;
    int? utcOffsetSeconds;
    String? timezone;
    String? timezoneAbbreviation;
    double? elevation;
    CurrentWeatherUnits? currentWeatherUnits;
    CurrentWeather? currentWeather;
    DailyUnits? dailyUnits;
    Daily? daily;

    Weather({
        this.latitude,
        this.longitude,
        this.generationtimeMs,
        this.utcOffsetSeconds,
        this.timezone,
        this.timezoneAbbreviation,
        this.elevation,
        this.currentWeatherUnits,
        this.currentWeather,
        this.dailyUnits,
        this.daily,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"]?.toDouble(),
        currentWeatherUnits: json["current_weather_units"] == null ? null : CurrentWeatherUnits.fromJson(json["current_weather_units"]),
        currentWeather: json["current_weather"] == null ? null : CurrentWeather.fromJson(json["current_weather"]),
        dailyUnits: json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]),
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather_units": currentWeatherUnits?.toJson(),
        "current_weather": currentWeather?.toJson(),
        "daily_units": dailyUnits?.toJson(),
        "daily": daily?.toJson(),
    };
}

class CurrentWeather {
    String? time;
    int? interval;
    double? temperature;
    double? windspeed;
    int? winddirection;
    int? isDay;
    int? weathercode;

    CurrentWeather({
        this.time,
        this.interval,
        this.temperature,
        this.windspeed,
        this.winddirection,
        this.isDay,
        this.weathercode,
    });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        time: json["time"],
        interval: json["interval"],
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
    };
}

class CurrentWeatherUnits {
    String? time;
    String? interval;
    String? temperature;
    String? windspeed;
    String? winddirection;
    String? isDay;
    String? weathercode;

    CurrentWeatherUnits({
        this.time,
        this.interval,
        this.temperature,
        this.windspeed,
        this.winddirection,
        this.isDay,
        this.weathercode,
    });

    factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) => CurrentWeatherUnits(
        time: json["time"],
        interval: json["interval"],
        temperature: json["temperature"],
        windspeed: json["windspeed"],
        winddirection: json["winddirection"],
        isDay: json["is_day"],
        weathercode: json["weathercode"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "is_day": isDay,
        "weathercode": weathercode,
    };
}

class DailyUnits {
    String? time;
    String? temperature2mMax;
    String? temperature2mMin;

    DailyUnits({
        this.time,
        this.temperature2mMax,
        this.temperature2mMin,
    });

    factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        temperature2mMax: json["temperature_2m_max"],
        temperature2mMin: json["temperature_2m_min"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m_max": temperature2mMax,
        "temperature_2m_min": temperature2mMin,
    };
}

class Daily {
    List<String>? time;
    List<double>? temperature2mMax;
    List<double>? temperature2mMin;

    Daily({
        this.time,
        this.temperature2mMax,
        this.temperature2mMin,
    });

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] == null ? [] : List<String>.from(json["time"].map((x) => x)),
        temperature2mMax: json["temperature_2m_max"] == null ? [] : List<double>.from(json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2mMin: json["temperature_2m_min"] == null ? [] : List<double>.from(json["temperature_2m_min"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
        "temperature_2m_max": temperature2mMax == null ? [] : List<dynamic>.from(temperature2mMax!.map((x) => x)),
        "temperature_2m_min": temperature2mMin == null ? [] : List<dynamic>.from(temperature2mMin!.map((x) => x)),
    };
}
