import 'package:equatable/equatable.dart';
import 'ticket_details_item_model.dart';

/// This class defines the variables used in the [TicketDetails_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TicketDetailsModel extends Equatable {
  TicketDetailsModel({this.ticketDetailsItemList = const []});

  final List<TicketDetailsItemModel> ticketDetailsItemList;

  TicketDetailsModel copyWith(
      {List<TicketDetailsItemModel>? ticketDetailsItemList}) {
    return TicketDetailsModel(
      ticketDetailsItemList:
          ticketDetailsItemList ?? this.ticketDetailsItemList,
    );
  }

  @override
  List<Object?> get props => [ticketDetailsItemList];
}
