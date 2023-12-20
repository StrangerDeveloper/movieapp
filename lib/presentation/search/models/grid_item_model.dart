import '../../../core/app_export.dart';

/// This class is used in the [grid_item_widget] screen.
class GridItemModel {
  GridItemModel({
    this.comediesImage,
    this.comediesText,
    this.id,
  }) {
    comediesImage = comediesImage ?? ImageConstant.imgRectangle2235;
    comediesText = comediesText ?? "Comedies";
    id = id ?? "";
  }

  String? comediesImage;

  String? comediesText;

  String? id;
}
