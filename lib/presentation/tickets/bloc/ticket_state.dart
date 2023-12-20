// ignore_for_file: must_be_immutable

part of 'ticket_bloc.dart';

/// Represents the state of Six in the application.
class TicketState extends Equatable {
  TicketState({this.sixModelObj});

 final TicketModel? sixModelObj;

  @override
  List<Object?> get props => [
        sixModelObj,
      ];
  TicketState copyWith({TicketModel? sixModelObj}) {
    return TicketState(
      sixModelObj: sixModelObj ?? this.sixModelObj,
    );
  }
}
