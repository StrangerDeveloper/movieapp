import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/data/apiClient/repo.dart';
import 'package:movieapp/presentation/movie_details/models/movie_detail_model.dart';
import '/core/app_export.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

/// A bloc that manages the state of a Movie Details according to the event that is dispatched to it.
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailsBloc(this.movieRepository) : super(MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetail);
    //on<UpdateChipViewEvent>(_updateChipView);
  }

  _getMovieDetail(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        message: 'loading...'
      ),
    );

    print("MovieID: bloc ${event.id}");
    final result = await movieRepository.getMovieDetails(event.id!);
    print("MovieID: bloc ${result.toString()}");
    
    return emit(
      state.copyWith(
        status: RequestStatus.loaded,
        movieDetailsModel: result,
      ),
    );
    // result.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       status: RequestStatus.error,
    //     ),
    //   ),
    //   (previous, element) => emit(
    //     state.copyWith(
    //       status: RequestStatus.loaded,
    //       movieDetails: element,
    //     ),
    //   ),
    // );
    // emit(state.copyWith(
    //     fiveModelObj: state.fiveModelObj
    //         ?.copyWith(chipviewItemList: fillChipviewItemList())));
  }

  // _updateChipView(
  //   UpdateChipViewEvent event,
  //   Emitter<FiveState> emit,
  // ) {
  //   List<ChipviewItemModel> newList =
  //       List<ChipviewItemModel>.from(state.fiveModelObj!.chipviewItemList);
  //   newList[event.index] =
  //       newList[event.index].copyWith(isSelected: event.isSelected);
  //   emit(state.copyWith(
  //       fiveModelObj: state.fiveModelObj?.copyWith(chipviewItemList: newList)));
  // }

  // List<ChipviewItemModel> fillChipviewItemList() {
  //   return List.generate(4, (index) => ChipviewItemModel());
  // }
}
