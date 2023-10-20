import 'package:core_dependency/core_dependency.dart';

class SearchData extends Equatable {
  final int id;
  final String name;
  final String country;
  final double lat;
  final double lon;

  const SearchData({
    required this.id,
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [id];
}
