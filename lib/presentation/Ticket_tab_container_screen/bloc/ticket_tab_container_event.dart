// ignore_for_file: must_be_immutable

part of 'ticket_tab_container_bloc.dart';

abstract class TicketTabContainerEvent extends Equatable {}

/// Event that is dispatched when the TicketTabContainer widget is first created.
class TicketTabContainerInitialEvent extends TicketTabContainerEvent {
  @override
  List<Object?> get props => [];
}
