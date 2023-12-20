import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

import 'app_colors.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: AppColors().gray100,
      );
  static BoxDecoration get fillGray500 => BoxDecoration(
        color: AppColors().gray500.withOpacity(0.1),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: AppColors().whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientErrorContainerToErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
             AppColors.error,
            AppColors.secondary.withOpacity(0.5),
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.73, 1),
          end: Alignment(0.73, 0),
          colors: [
            AppColors.error.withOpacity(0.5),
            AppColors.secondary.withOpacity(0.5),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineOnPrimaryContainer => BoxDecoration(
        color: AppColors().whiteA700,
        border: Border.all(
          color: AppColors().primaryContainer,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
        border: Border.all(
          color: AppColors().primaryContainer,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL10 => BorderRadius.vertical(
        bottom: Radius.circular(10.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
