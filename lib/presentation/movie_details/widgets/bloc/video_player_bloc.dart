import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/data/repo.dart';

import 'video_player_event.dart';
import 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final MovieRepository? movieRepository;

  VideoPlayerBloc(this.movieRepository) : super(VideoPlayerState()) {
    on<GetMovieTrailerEvent>(_getVideos);
  }

  Future<void> _getVideos(
    GetMovieTrailerEvent event,
    Emitter<VideoPlayerState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading, message: "Loading"));

    try {
      final result = await movieRepository!.getMovieTrailers(event.movieID!);
      print("result $result");

      emit(state.copyWith(status: RequestStatus.loaded, videoList: result));
    } catch (e) {
      emit(state.copyWith(
        status: RequestStatus.error,
        message: "Error loading trailers: $e",
      ));
    }
  }
}
