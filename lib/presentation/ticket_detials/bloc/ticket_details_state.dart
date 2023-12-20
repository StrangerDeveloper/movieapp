// ignore_for_file: must_be_immutable

part of 'ticket_details_bloc.dart';

/// Represents the state of TicketDetails in the application.
class TicketDetailsState extends Equatable {
  TicketDetailsState({
    this.selected = false,
    this.notavailable = false,
    this.vip = false,
    this.regularFifty = false,
    this.ticketDetailsModelObj,
  });

  TicketDetailsModel? ticketDetailsModelObj;

  bool selected;

  bool notavailable;

  bool vip;

  bool regularFifty;

  @override
  List<Object?> get props => [
        selected,
        notavailable,
        vip,
        regularFifty,
        ticketDetailsModelObj,
      ];
  TicketDetailsState copyWith({
    bool? selected,
    bool? notavailable,
    bool? vip,
    bool? regularFifty,
    TicketDetailsModel? ticketDetailsModelObj,
  }) {
    return TicketDetailsState(
      selected: selected ?? this.selected,
      notavailable: notavailable ?? this.notavailable,
      vip: vip ?? this.vip,
      regularFifty: regularFifty ?? this.regularFifty,
      ticketDetailsModelObj: ticketDetailsModelObj ?? this.ticketDetailsModelObj,
    );
  }
}
