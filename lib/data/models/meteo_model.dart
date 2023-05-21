import 'package:json_annotation/json_annotation.dart';

part 'meteo_model.g.dart';

@JsonSerializable()
class MeteoModel {
  Location location;
  CurrentWeather current;

  MeteoModel({
    required this.location,
    required this.current,
  });

  factory MeteoModel.fromJson(Map<String, dynamic> json) =>
      _$MeteoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeteoModelToJson(this);
}

@JsonSerializable()
class Location {
  String name;
  String region;
  String country;

  Location({
    required this.name,
    required this.region,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CurrentWeather {
  double tempC;
  double tempF;
  WeatherCondition condition;

  CurrentWeather({
    required this.tempC,
    required this.tempF,
    required this.condition,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class WeatherCondition {
  String text;
  int code;

  WeatherCondition({
    required this.text,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}
