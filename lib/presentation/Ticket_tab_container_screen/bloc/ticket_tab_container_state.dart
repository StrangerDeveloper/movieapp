// ignore_for_file: must_be_immutable

part of 'ticket_tab_container_bloc.dart';

/// Represents the state of TicketTabContainer in the application.
class TicketTabContainerState extends Equatable {
  TicketTabContainerState({this.ticketTabContainerModelObj});

  TicketTabContainerModel? ticketTabContainerModelObj;

  @override
  List<Object?> get props => [
        ticketTabContainerModelObj,
      ];
  TicketTabContainerState copyWith(
      {TicketTabContainerModel? ticketTabContainerModelObj}) {
    return TicketTabContainerState(
      ticketTabContainerModelObj:
          ticketTabContainerModelObj ?? this.ticketTabContainerModelObj,
    );
  }
}
