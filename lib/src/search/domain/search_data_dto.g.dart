// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDataDto _$SearchDataDtoFromJson(Map<String, dynamic> json) =>
    SearchDataDto(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchDataDtoToJson(SearchDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
