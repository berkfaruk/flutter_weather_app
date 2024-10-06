// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    List<Result>? results;
    double? generationtimeMs;

    Location({
        this.results,
        this.generationtimeMs,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "generationtime_ms": generationtimeMs,
    };
}

class Result {
    int? id;
    String? name;
    double? latitude;
    double? longitude;
    double? elevation;
    String? featureCode;
    String? countryCode;
    int? admin1Id;
    String? timezone;
    int? population;
    int? countryId;
    String? country;
    String? admin1;

    Result({
        this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.elevation,
        this.featureCode,
        this.countryCode,
        this.admin1Id,
        this.timezone,
        this.population,
        this.countryId,
        this.country,
        this.admin1,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        admin1Id: json["admin1_id"],
        timezone: json["timezone"],
        population: json["population"],
        countryId: json["country_id"],
        country: json["country"],
        admin1: json["admin1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "admin1_id": admin1Id,
        "timezone": timezone,
        "population": population,
        "country_id": countryId,
        "country": country,
        "admin1": admin1,
    };
}
