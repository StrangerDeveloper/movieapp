// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'ticket_item_model.dart';


/// This class defines the variables used in the [six_page],
/// and is typically used to hold data that is passed between different parts of the application.
class TicketModel extends Equatable {
  TicketModel({this.ticketItemList = const []});

  List<TicketItemModel> ticketItemList;

  TicketModel copyWith({List<TicketItemModel>? ticketItemList}) {
    return TicketModel(
      ticketItemList: ticketItemList ?? this.ticketItemList,
    );
  }

  @override
  List<Object?> get props => [ticketItemList];
}
