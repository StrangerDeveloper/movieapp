// ignore_for_file: must_be_immutable

part of 'movie_bloc.dart';

/// Represents the state of Home in the application.
class MovieState extends Equatable {
  final List<MovieModel> movies;
  final RequestStatus status;
  final String message;
  MovieState({
    this.movies = const [],
    this.status = RequestStatus.loading,
    this.message = '',
  });

  MovieState copyWith({
    List<MovieModel>? movies,
    RequestStatus? status,
    String? message,
  }) {
    return MovieState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        movies,
        status,
        message,
      ];
}
