// ignore_for_file: must_be_immutable

part of 'movie_detail_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final String? id;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateChipViewEvent extends MovieDetailsEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
  });

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
      ];
}
