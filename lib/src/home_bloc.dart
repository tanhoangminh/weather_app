import 'dart:convert';

import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

@injectable
class LocationManageBloc extends Bloc<LocationEvent, LocationState> {
  final CacheBehavior cache;

  LocationManageBloc(this.cache) : super(LocationState()) {
    on<_Fetch>(onFetch);
    on<Save>(onSave);
    add(_Fetch());
  }

  Future onFetch(_, Emitter<LocationState> emit) async {
    final data = await cache.read<String>(CacheKey.weatherListKey);
    List<String> list = [];
    if (data != null) {
      list = List<String>.from(jsonDecode(data));
    }
    emit(LocationState(data: list));
  }

  Future onSave(Save event, Emitter<LocationState> emit) async {
    final data = await cache.read<String>(CacheKey.weatherListKey);
    List<String> result = [event.name];
    if(data != null) {
      result.addAll(List<String>.from(jsonDecode(data)));
    }
    await cache.save(CacheKey.weatherListKey, result);
    emit(LocationState(data: result));
  }
}

class LocationState {
  final List<String> data;

  LocationState({this.data = const []});
}

abstract class LocationEvent {}

class _Fetch extends LocationEvent {}

class Save extends LocationEvent {
  final String name;

  Save(this.name);
}
