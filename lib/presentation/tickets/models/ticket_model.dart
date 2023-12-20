// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'ticket_item_model.dart';


class TicketModel extends Equatable {
  TicketModel({this.ticketItemList});

  List<TicketItemModel>? ticketItemList;

  TicketModel copyWith({List<TicketItemModel>? ticketItemList}) {
    return TicketModel(
      ticketItemList: ticketItemList ?? this.ticketItemList,
    );
  }

  @override
  List<Object?> get props => [ticketItemList];
}
