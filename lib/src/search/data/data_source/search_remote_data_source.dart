import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/search/domain/search_data_dto.dart';

part 'search_remote_data_source.g.dart';

@LazySingleton()
@RestApi()
abstract class SearchRemoteDataSource {
  @factoryMethod
  factory SearchRemoteDataSource(Dio dio) = _SearchRemoteDataSource;

  @GET('search.json')
  Future<List<SearchDataDto>> get(@Query('q') String keyword);
}
