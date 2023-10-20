import 'package:weather_app/src/info/data/repository/weather_info.dart';

abstract class WeatherService {
  Future<WeatherInfo> get(String name);
}
