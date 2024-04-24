import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/data/repo.dart';
import 'package:movieapp/presentation/search/models/search_result_item_model.dart';
import 'package:stream_transform/stream_transform.dart';

import '/core/app_export.dart';
import '../models/grid_item_model.dart';
part 'search_event.dart';
part 'search_state.dart';

const _duration = Duration(milliseconds: 400);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository movieRepository;

  SearchBloc(this.movieRepository) : super(SearchState()) {
    on<GetSearchResultsEvent>(_onSearch, transformer: debounce(_duration));
  }

  List<GridItemModel> fillGridItemList() {
    return [
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2235,
          comediesText: "Comedies"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2236, comediesText: "Crime"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2237,
          comediesText: "Family"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2238,
          comediesText: "Documentaries"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2239,
          comediesText: "Dramas"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2240,
          comediesText: "Fantasy"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2241,
          comediesText: "Holidays"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2242,
          comediesText: "Horror"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2243,
          comediesText: "Sci-Fi"),
      GridItemModel(
          comediesImage: ImageConstant.imgRectangle2244,
          comediesText: "Thriller")
    ];
  }

  _onSearch(
    GetSearchResultsEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.title.isEmpty) {
      return emit(state.copyWith(
          status: SearchRequestStatus.empty, gridItemList: fillGridItemList()));
    }

    emit(
      state.copyWith(
        status: SearchRequestStatus.loading,
      ),
    );

    final result = await movieRepository.search(event.title);

    result.fold(
        (l) => emit(
              state.copyWith(
                status: SearchRequestStatus.error,
                message: l.message,
              ),
            ), (previousValue, element) {
      if (result.isEmpty) {
        emit(
          state.copyWith(
              status: SearchRequestStatus.noResults,
              gridItemList: fillGridItemList()),
        );
      } else {
        emit(
          state.copyWith(
            status: SearchRequestStatus.loaded,
            searchResult: result,
          ),
        );
      }
    });
  }
}
