part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  MovieDetailState({
    this.movieDetailsModel,
    this.status,
    this.message,
  });
  final MovieDetailModel? movieDetailsModel;
  final RequestStatus? status;
  final String? message;

  MovieDetailState copyWith({
    MovieDetailModel? movieDetailsModel,
    RequestStatus? status,
    String? message,
  }) {
    print("MovieID: state: ${movieDetailsModel.toString()}");
    return MovieDetailState(
      movieDetailsModel: movieDetailsModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [movieDetailsModel, status, message];
}
