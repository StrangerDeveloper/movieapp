// ignore_for_file: must_be_immutable

part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {}

/// Event that is dispatched when the Six widget is first created.
class SixInitialEvent extends TicketEvent {
  @override
  List<Object?> get props => [];
}
