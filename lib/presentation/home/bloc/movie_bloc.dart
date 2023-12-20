import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/data/apiClient/repo.dart';
import 'package:movieapp/presentation/home/models/movie_model.dart';
import '/core/app_export.dart';
part 'movie_event.dart';
part 'movie_state.dart';

/// A bloc that manages the state of a Movie according to the event that is dispatched to it.
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super(MovieState()) {
    on<GetMovieEvent>(_onGetMovie);
  }

  Future<void> _onGetMovie(
    GetMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _movieRepository.getUpCommingMovies();
    // emit(
    //   state.copyWith(status: RequestStatus.loaded, movies: result)
    // );

    result.fold(
      (initial) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: initial.message,
        ),
      ),
      (previousValue, element) => emit(
        state.copyWith(status: RequestStatus.loaded, movies: result),
      ),
    );
  }
}
