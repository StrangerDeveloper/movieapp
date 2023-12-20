part of 'movie_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Home widget.
///
abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OneContainer widget is first created.
class GetMovieEvent extends MovieEvent {}
