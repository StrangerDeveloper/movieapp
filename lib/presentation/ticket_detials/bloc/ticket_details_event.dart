// ignore_for_file: must_be_immutable

part of 'ticket_details_bloc.dart';

abstract class TicketDetailsEvent extends Equatable {}

class TicketDetailsInitialEvent extends TicketDetailsEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCheckBoxEvent extends TicketDetailsEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeCheckBox1Event extends TicketDetailsEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeCheckBox2Event extends TicketDetailsEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeCheckBox3Event extends TicketDetailsEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
