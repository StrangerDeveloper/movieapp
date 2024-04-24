import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/data/repo.dart';
import 'package:movieapp/presentation/movie_details/models/movie_detail_model.dart';
import '/core/app_export.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailsBloc(this.movieRepository) : super(MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetail);
  }

  _getMovieDetail(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(
      state.copyWith(status: RequestStatus.loading, message: 'loading...'),
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
  }
}
