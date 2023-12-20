import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/functions.dart';

class MovieModel extends Equatable {
  const MovieModel(
      {this.tmdbID,
      this.title,
      this.posterUrl,
      this.backDropUrl,
      this.isVideo});
  final int? tmdbID;
  final String? title, posterUrl, backDropUrl;
  final bool? isVideo;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        tmdbID: json['id'],
        title: json['title'],
        posterUrl: getPosterUrl(json['poster_path']),
        backDropUrl: getBackdropUrl(json['backdrop_path']),
        isVideo: true,
      );

  @override
  List<Object?> get props => [tmdbID, title, posterUrl, backDropUrl, isVideo];
}
