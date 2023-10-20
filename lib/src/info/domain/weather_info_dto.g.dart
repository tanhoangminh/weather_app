// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoDto _$WeatherInfoDtoFromJson(Map<String, dynamic> json) =>
    WeatherInfoDto(
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherInfoDtoToJson(WeatherInfoDto instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
