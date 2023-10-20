import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/info/data/repository/weather_info.dart';
import 'package:weather_app/src/info/domain/weather_service.dart';

part 'weather_bloc.freezed.dart';

part 'weather_event.dart';

part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(const WeatherStateInitial()) {
    on<_Fetch>(onFetch);
  }

  Future onFetch(_Fetch event, Emitter<WeatherState> emit) async {
    try {
      final data = await weatherService.get(event.name);
      emit(WeatherStateLoaded(info: data));
    } catch (e) {
      emit(const WeatherStateFailure());
    }
  }
}
