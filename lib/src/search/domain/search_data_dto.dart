import 'package:weather_app/src/search/domain/search_data.dart';
import 'package:core_dependency/core_dependency.dart';

part 'search_data_dto.g.dart';

@JsonSerializable()
class SearchDataDto extends SearchData {
  const SearchDataDto({
    required super.id,
    required super.name,
    required super.country,
    required super.lat,
    required super.lon,
  });

  factory SearchDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDataDtoFromJson(json);
}
