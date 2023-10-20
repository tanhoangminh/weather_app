import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/search/data/data_source/search_remote_data_source.dart';
import 'package:weather_app/src/search/domain/search_data.dart';
import 'package:weather_app/src/search/domain/search_service.dart';

@Injectable(as: SearchService)
class SearchServiceImpl extends SearchService {
  final SearchRemoteDataSource remoteDataSource;

  SearchServiceImpl(this.remoteDataSource);

  @override
  Future<List<SearchData>> get(String keyword) {
    return remoteDataSource.get(keyword);
  }
}
