import '../../../core/app_export.dart';

/// This class is used in the [TicketDetails_item_widget] screen.
class TicketDetailsItemModel {
  TicketDetailsItemModel({
    this.contrast,
    this.id,
  }) {
    contrast = contrast ?? ImageConstant.imgContrast;
    id = id ?? "";
  }

  String? contrast;

  String? id;
}
