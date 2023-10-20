part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  factory WeatherEvent.fetch(String name) = _Fetch;
}