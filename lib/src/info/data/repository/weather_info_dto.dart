import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';

part 'weather_info_dto.g.dart';

@JsonSerializable()
class WeatherInfoDto extends WeatherInfo {
  WeatherInfoDto({required super.current, required super.location});

  factory WeatherInfoDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoDtoFromJson(json);
}
