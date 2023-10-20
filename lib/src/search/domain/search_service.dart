import 'package:weather_app/src/search/domain/search_data.dart';

abstract class SearchService {
  Future<List<SearchData>> get(String keyword);
}