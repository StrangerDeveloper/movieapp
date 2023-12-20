import '../models/ticket_details_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

class TicketDetailsItemWidget extends StatelessWidget {
  TicketDetailsItemWidget(
    this.ticketDetailsItemModelObj, {
    Key? key,
  }) : super(key: key);

  final TicketDetailsItemModel ticketDetailsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ticketDetailsItemModelObj.contrast,
      height: 6.adaptSize,
      width: 6.adaptSize,
    );
  }
}
