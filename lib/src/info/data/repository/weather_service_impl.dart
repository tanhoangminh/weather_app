import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/info/data/data_source/weather_remote_data_source.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';
import 'package:weather_app/src/info/domain/weather_service.dart';

@Injectable(as: WeatherService)
class WeatherServiceImpl extends WeatherService {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherServiceImpl(this.remoteDataSource);

  @override
  Future<WeatherInfo> get(String name) {
    return remoteDataSource.get(name, 'vi');
  }
}
