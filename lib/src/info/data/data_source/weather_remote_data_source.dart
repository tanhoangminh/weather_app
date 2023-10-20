import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/info/data/repository/weather_info_dto.dart';

part 'weather_remote_data_source.g.dart';

@LazySingleton()
@RestApi()
abstract class WeatherRemoteDataSource {
  @factoryMethod
  factory WeatherRemoteDataSource(Dio dio) = _WeatherRemoteDataSource;

  @GET('current.json')
  Future<WeatherInfoDto> get(
    @Query('q') String name,
    @Query('lang') String code,
  );
}
