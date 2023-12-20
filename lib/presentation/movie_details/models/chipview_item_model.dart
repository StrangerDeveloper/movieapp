// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipview_item_widget] screen.
class ChipviewItemModel extends Equatable {
  ChipviewItemModel({
    this.action,
    this.isSelected,
  }) {
    action = action ?? "Action";
    isSelected = isSelected ?? false;
  }

  String? action;

  bool? isSelected;

  ChipviewItemModel copyWith({
    String? action,
    bool? isSelected,
  }) {
    return ChipviewItemModel(
      action: action ?? this.action,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [action, isSelected];
}
