import 'package:movieapp/presentation/home/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

// ignore: must_be_immutable
class MoviecardItemWidget extends StatelessWidget {
  MoviecardItemWidget(
    this.moviecardItemModelObj, {
    Key? key,
    this.onTapImgMovieImage,
  }) : super(key: key);

  MovieModel moviecardItemModelObj;

  VoidCallback? onTapImgMovieImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomImageView(
          imagePath: moviecardItemModelObj.backDropUrl,
          // height: 180.v,
          // width: 335.h,
          radius: BorderRadius.circular(
            20.h,
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: 10.h,
          ),
          onTap: () {
            onTapImgMovieImage!.call();
          },
        ),
        Container(
          width: 335.h,
          padding: EdgeInsets.symmetric(
            //horizontal: 5.h,
            vertical: 25.v,
          ),
          // decoration:
          //     AppDecoration.gradientErrorContainerToErrorContainer.copyWith(
          //   borderRadius: BorderRadiusStyle.customBorderBL10,
          // ),
          child: Text(
            moviecardItemModelObj.title!,
            style: CustomTextStyles.titleMedium18,
          ),
        ),
      ],
    );
  }
}
