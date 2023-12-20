
part of 'ticket_bloc.dart';

/// Represents the state of Six in the application.
class TicketState extends Equatable {
  TicketState({this.ticketModel});

 final TicketModel? ticketModel;

  @override
  List<Object?> get props => [
        ticketModel,
      ];
  TicketState copyWith({TicketModel? sixModelObj}) {
    return TicketState(
      ticketModel: sixModelObj ?? this.ticketModel,
    );
  }
}
