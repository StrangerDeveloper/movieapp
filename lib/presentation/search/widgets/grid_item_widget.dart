import '../models/grid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

// ignore: must_be_immutable
class GridItemWidget extends StatelessWidget {
  GridItemWidget(
    this.gridItemModelObj, {
    Key? key,
  }) : super(key: key);

  GridItemModel gridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.v,
      width: 163.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: gridItemModelObj.comediesImage,
            height: 100.v,
            width: 163.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                bottom: 18.v,
              ),
              child: Text(
                gridItemModelObj.comediesText!,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
