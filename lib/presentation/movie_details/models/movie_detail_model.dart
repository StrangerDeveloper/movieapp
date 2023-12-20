import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/functions.dart';

/// This class defines the variables used in the [movieDetailsScreen],
/// and is typically used to hold data that is passed between different parts of the application.
class MovieDetailModel extends Equatable {
  final int? id;
  final int? tmdbID;
  final String? title;
  final String? posterUrl;
  final String? backdropUrl;
  final String? releaseDate;
  final List<Genres>? genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String? overview;
  final double? voteAverage;
  final String? voteCount;
  final String? trailerUrl;
  // final List<Cast>? cast;
  // final List<Review>? reviews;
  // final List<Season>? seasons;
  // final List<Media> similar;
  final bool? isAdded;

  MovieDetailModel({
    this.id,
    this.tmdbID,
    this.title,
    this.posterUrl,
    this.backdropUrl,
    this.releaseDate,
    this.genres,
    this.runtime,
    this.numberOfSeasons,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.trailerUrl,
    // this.cast,
    // this.reviews,
    // this.seasons,
    // required this.similar,
    this.isAdded = false,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      tmdbID: json['id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      releaseDate: json['release_date'],
      genres: List<Genres>.from(
          (json['genres'] as List).map((e) => Genres.fromJson(e))),
      runtime: '${json['runtime']}',
      overview: json['overview'] ?? '',
      voteAverage:
          double.parse((json['vote_average'] as double).toStringAsFixed(1)),
      voteCount: '${json['vote_count']}',
      //trailerUrl: getTrailerUrl(json),
      // cast: List<CastModel>.from(
      //     (json['credits']['cast'] as List).map((e) => CastModel.fromJson(e))),
      // reviews: List<ReviewModel>.from((json['reviews']['results'] as List)
      //     .map((e) => ReviewModel.fromJson(e))),
      // similar: List<MovieModel>.from((json['similar']['results'] as List)
      //     .map((e) => MovieModel.fromJson(e))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        tmdbID,
        title,
        posterUrl,
        backdropUrl,
        releaseDate,
        genres,
        overview,
        voteAverage,
        voteCount,
        trailerUrl,
        isAdded,
      ];
}

class Genres {
  final int? id;
  final String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(id: json['id'], name: json['name']);
  }
}
