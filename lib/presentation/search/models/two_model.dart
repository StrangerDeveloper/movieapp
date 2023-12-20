// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'grid_item_model.dart';

/// This class defines the variables used in the [two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TwoModel extends Equatable {
  TwoModel({this.gridItemList = const []});

  List<GridItemModel> gridItemList;

  TwoModel copyWith({List<GridItemModel>? gridItemList}) {
    return TwoModel(
      gridItemList: gridItemList ?? this.gridItemList,
    );
  }

  @override
  List<Object?> get props => [gridItemList];
}
