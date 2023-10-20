import 'package:core_dependency/core_dependency.dart';

part 'weather_info.g.dart';

class WeatherInfo {
  final Location location;

  final Current current;

  WeatherInfo({required this.current, required this.location});
}

@JsonSerializable()
class Location {
  final String name;
  final String country;
  final String localtime;

  Location({
    required this.name,
    required this.country,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'temp_c')
  final double tempC;

  @JsonKey(name: 'temp_f')
  final double tempF;

  final Condition condition;

  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  Current({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.lastUpdated,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@JsonSerializable()
class Condition {
  final String text;

  Condition(this.text);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}
