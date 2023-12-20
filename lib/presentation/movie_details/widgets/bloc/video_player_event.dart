import 'package:equatable/equatable.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();
}

class GetMovieTrailerEvent extends VideoPlayerEvent {
  final String? movieID;
  const GetMovieTrailerEvent(this.movieID);
  
  @override
  List<Object?> get props => [movieID];

}