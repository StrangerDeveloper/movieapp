import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/functions.dart';

class SearchResultItemModel extends Equatable {
  final int? tmdbID;
  final String? posterUrl;
  final String? title;
  final bool? isMovie;

  SearchResultItemModel({
    required this.tmdbID,
    required this.posterUrl,
    required this.title,
    required this.isMovie,
  });
  factory SearchResultItemModel.fromJson(Map<String, dynamic> json) {
    return SearchResultItemModel(
      tmdbID: json['id'],
      posterUrl: getPosterUrl(json['poster_path']),
      title: json['title'] ?? json['name'],
      isMovie: json['media_type'] == 'movie',
    );
  }

  @override
  List<Object?> get props => [tmdbID, posterUrl, title, isMovie];
}
