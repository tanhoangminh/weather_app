import 'package:core_dependency/core_dependency.dart';
import 'package:weather_app/src/search/domain/search_data.dart';
import 'package:weather_app/src/search/domain/search_service.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService service;

  SearchBloc(this.service) : super(const _Initial()) {
    on<_Search>(
      onSearch,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );
  }

  Future onSearch(_Search event, Emitter<SearchState> emit) async {
    try {
      final data = await service.get(event.keyword);
      emit(state.copyWith(data: data));
    } catch (e) {
      emit(state.copyWith(data: []));
    }
  }
}
