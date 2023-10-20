part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = WeatherStateInitial;

  const factory WeatherState.loaded({required WeatherInfo info}) =
      WeatherStateLoaded;

  const factory WeatherState.failure() = WeatherStateFailure;
}
