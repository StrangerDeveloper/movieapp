// ignore_for_file: must_be_immutable

part of 'movie_detail_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MovieDetail widget.
///.
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

/// Event that is dispatched when the Five widget is first created.
class GetMovieDetailsEvent extends MovieDetailsEvent {
  final String? id;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object?> get props => [id];
}



///Event for changing ChipView selection
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
