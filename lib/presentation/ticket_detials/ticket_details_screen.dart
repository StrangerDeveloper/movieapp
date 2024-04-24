import '../../core/resources/app_colors.dart';
import 'bloc/ticket_details_bloc.dart';
import 'models/ticket_details_item_model.dart';
import 'models/ticket_details_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/widgets/custom_elevated_button.dart';
import 'package:movieapp/widgets/custom_icon_button.dart';

import 'widgets/ticket_details_item_widget.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TicketDetailsBloc>(
      create: (context) => TicketDetailsBloc(
          TicketDetailsState(ticketDetailsModelObj: TicketDetailsModel()))
        ..add(TicketDetailsInitialEvent()),
      child: TicketDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketDetailsBloc>(
      create: (context) => TicketDetailsBloc(
          TicketDetailsState(ticketDetailsModelObj: TicketDetailsModel()))
        ..add(TicketDetailsInitialEvent()),
      child: body(context),
    );
  }

  Widget body(context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildStackImageText(context),
              Padding(
                padding: EdgeInsets.only(top: 42.v, bottom: 50.v),
                child: _buildMainFrame(context),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(
                        height: 29.adaptSize,
                        width: 29.adaptSize,
                        padding: EdgeInsets.all(9.h),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgFrame11902),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: CustomIconButton(
                          height: 29.adaptSize,
                          width: 29.adaptSize,
                          padding: EdgeInsets.all(9.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup11897),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              _buildColumnSelectedRow(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStackImageText(BuildContext context) {
    return SizedBox(
      height: 76.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
              decoration: AppDecoration.outlineOnPrimaryContainer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftErrorcontainer,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        onTap: () {
                          onTapImgArrowLeft(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 84.h, top: 5.v),
                        child: Text("Movie 2",
                            style:
                                CustomTextStyles.titleMediumPrimaryContainer_1),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "5-march-2021",
                              style: CustomTextStyles.labelLargePrimary_2,
                            ),
                            TextSpan(
                              text: "12:30 Hall 1",
                              style: CustomTextStyles.labelLargePrimary,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeftErrorcontainer,
            height: 30.adaptSize,
            width: 30.adaptSize,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 13.h, top: 15.v),
          ),
        ],
      ),
    );
  }

  Widget _buildMainFrame(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 5.h, right: 23.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 39.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text("lbl_1",
                        style: CustomTextStyles.poppinsPrimaryContainer),
                  ),
                  SizedBox(height: 7.v),
                  Text("lbl_2",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Text("lbl_3",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 5.v),
                  Text("lbl_4",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Text("lbl_5",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Text("lbl_6",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 7.v),
                  Text("lbl_7",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Text("lbl_8",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Text("lbl_9",
                      style: CustomTextStyles.poppinsPrimaryContainer),
                  SizedBox(height: 6.v),
                  Align(
                    alignment: Alignment.center,
                    child: Text("lbl_10",
                        style: CustomTextStyles.poppinsPrimaryContainer),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 34.v,
                      width: 327.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse36,
                              height: 34.v,
                              width: 327.h,
                              alignment: Alignment.center),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.v),
                              child: Text("lbl_screen".toUpperCase(),
                                  style: theme.textTheme.labelSmall),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgClose,
                                  height: 6.adaptSize,
                                  width: 6.adaptSize),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 18.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgContrast,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 18.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                margin: EdgeInsets.only(left: 5.h),
                              )
                            ])),
                    SizedBox(height: 8.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: BlocSelector<TicketDetailsBloc, TicketDetailsState,
                          TicketDetailsModel?>(
                        selector: (state) => state.ticketDetailsModelObj,
                        builder: (context, ticketDetailsModelObj) {
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 7.v,
                                    crossAxisCount: 22,
                                    mainAxisSpacing: 5.h,
                                    crossAxisSpacing: 5.h),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ticketDetailsModelObj
                                    ?.ticketDetailsItemList.length ??
                                0,
                            itemBuilder: (context, index) {
                              TicketDetailsItemModel model =
                                  ticketDetailsModelObj
                                          ?.ticketDetailsItemList[index] ??
                                      TicketDetailsItemModel();
                              return TicketDetailsItemWidget(model);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgContrast,
                        closeImage1: ImageConstant.imgContrast,
                        contrastImage: ImageConstant.imgClose,
                        contrastImage1: ImageConstant.imgClose,
                        closeImage2: ImageConstant.imgClose,
                        closeImage3: ImageConstant.imgContrast,
                        closeImage4: ImageConstant.imgContrast,
                        contrastImage2: ImageConstant.imgClose,
                        contrastImage3: ImageConstant.imgClose,
                        closeImage5: ImageConstant.imgContrast,
                        closeImage6: ImageConstant.imgContrast,
                        contrastImage4: ImageConstant.imgClose,
                        contrastImage5: ImageConstant.imgClose,
                        closeImage7: ImageConstant.imgContrast,
                        closeImage8: ImageConstant.imgContrast,
                        contrastImage6: ImageConstant.imgClose,
                        contrastImage7: ImageConstant.imgClose,
                        closeImage9: ImageConstant.imgContrast,
                        closeImage10: ImageConstant.imgContrast,
                        closeImage11: ImageConstant.imgClose,
                        contrastImage8: ImageConstant.imgClose,
                        contrastImage9: ImageConstant.imgClose,
                        closeImage12: ImageConstant.imgContrast,
                        closeImage13: ImageConstant.imgContrast),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgClose,
                        closeImage1: ImageConstant.imgClose,
                        contrastImage: ImageConstant.imgContrast,
                        contrastImage1: ImageConstant.imgContrast,
                        closeImage2: ImageConstant.imgClose,
                        closeImage3: ImageConstant.imgClose,
                        closeImage4: ImageConstant.imgClose,
                        contrastImage2: ImageConstant.imgContrast,
                        contrastImage3: ImageConstant.imgContrast,
                        closeImage5: ImageConstant.imgClose,
                        closeImage6: ImageConstant.imgClose,
                        contrastImage4: ImageConstant.imgContrast,
                        contrastImage5: ImageConstant.imgContrast,
                        closeImage7: ImageConstant.imgClose,
                        closeImage8: ImageConstant.imgClose,
                        contrastImage6: ImageConstant.imgContrast,
                        contrastImage7: ImageConstant.imgContrast,
                        closeImage9: ImageConstant.imgClose,
                        closeImage10: ImageConstant.imgClose,
                        closeImage11: ImageConstant.imgClose,
                        contrastImage8: ImageConstant.imgContrast,
                        contrastImage9: ImageConstant.imgContrast,
                        closeImage12: ImageConstant.imgClose,
                        closeImage13: ImageConstant.imgClose),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgContrast,
                        closeImage1: ImageConstant.imgContrast,
                        contrastImage: ImageConstant.imgClose,
                        contrastImage1: ImageConstant.imgClose,
                        closeImage2: ImageConstant.imgClose,
                        closeImage3: ImageConstant.imgContrast,
                        closeImage4: ImageConstant.imgContrast,
                        contrastImage2: ImageConstant.imgClose,
                        contrastImage3: ImageConstant.imgClose,
                        closeImage5: ImageConstant.imgContrast,
                        closeImage6: ImageConstant.imgContrast,
                        contrastImage4: ImageConstant.imgClose,
                        contrastImage5: ImageConstant.imgClose,
                        closeImage7: ImageConstant.imgContrast,
                        closeImage8: ImageConstant.imgContrast,
                        contrastImage6: ImageConstant.imgClose,
                        contrastImage7: ImageConstant.imgClose,
                        closeImage9: ImageConstant.imgContrast,
                        closeImage10: ImageConstant.imgContrast,
                        closeImage11: ImageConstant.imgClose,
                        contrastImage8: ImageConstant.imgClose,
                        contrastImage9: ImageConstant.imgClose,
                        closeImage12: ImageConstant.imgContrast,
                        closeImage13: ImageConstant.imgContrast),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgClose,
                        closeImage1: ImageConstant.imgClose,
                        contrastImage: ImageConstant.imgContrast,
                        contrastImage1: ImageConstant.imgContrast,
                        closeImage2: ImageConstant.imgClose,
                        closeImage3: ImageConstant.imgClose,
                        closeImage4: ImageConstant.imgClose,
                        contrastImage2: ImageConstant.imgContrast,
                        contrastImage3: ImageConstant.imgContrast,
                        closeImage5: ImageConstant.imgClose,
                        closeImage6: ImageConstant.imgClose,
                        contrastImage4: ImageConstant.imgContrast,
                        contrastImage5: ImageConstant.imgContrast,
                        closeImage7: ImageConstant.imgClose,
                        closeImage8: ImageConstant.imgClose,
                        contrastImage6: ImageConstant.imgContrast,
                        contrastImage7: ImageConstant.imgContrast,
                        closeImage9: ImageConstant.imgClose,
                        closeImage10: ImageConstant.imgClose,
                        closeImage11: ImageConstant.imgClose,
                        contrastImage8: ImageConstant.imgContrast,
                        contrastImage9: ImageConstant.imgContrast,
                        closeImage12: ImageConstant.imgClose,
                        closeImage13: ImageConstant.imgClose),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgContrast,
                        closeImage1: ImageConstant.imgContrast,
                        contrastImage: ImageConstant.imgClose,
                        contrastImage1: ImageConstant.imgClose,
                        closeImage2: ImageConstant.imgClose,
                        closeImage3: ImageConstant.imgContrast,
                        closeImage4: ImageConstant.imgContrast,
                        contrastImage2: ImageConstant.imgClose,
                        contrastImage3: ImageConstant.imgClose,
                        closeImage5: ImageConstant.imgContrast,
                        closeImage6: ImageConstant.imgContrast,
                        contrastImage4: ImageConstant.imgClose,
                        contrastImage5: ImageConstant.imgClose,
                        closeImage7: ImageConstant.imgContrast,
                        closeImage8: ImageConstant.imgContrast,
                        contrastImage6: ImageConstant.imgClose,
                        contrastImage7: ImageConstant.imgClose,
                        closeImage9: ImageConstant.imgContrast,
                        closeImage10: ImageConstant.imgContrast,
                        closeImage11: ImageConstant.imgClose,
                        contrastImage8: ImageConstant.imgClose,
                        contrastImage9: ImageConstant.imgClose,
                        closeImage12: ImageConstant.imgContrast,
                        closeImage13: ImageConstant.imgContrast),
                    SizedBox(height: 8.v),
                    _buildFrameRow(context,
                        closeImage: ImageConstant.imgTelevision,
                        closeImage1: ImageConstant.imgTelevision,
                        contrastImage: ImageConstant.imgTelevision,
                        contrastImage1: ImageConstant.imgTelevision,
                        closeImage2: ImageConstant.imgTelevision,
                        closeImage3: ImageConstant.imgTelevision,
                        closeImage4: ImageConstant.imgTelevision,
                        contrastImage2: ImageConstant.imgTelevision,
                        contrastImage3: ImageConstant.imgTelevision,
                        closeImage5: ImageConstant.imgContrastBlueGray100,
                        closeImage6: ImageConstant.imgTelevision,
                        contrastImage4: ImageConstant.imgTelevision,
                        contrastImage5: ImageConstant.imgTelevision,
                        closeImage7: ImageConstant.imgTelevision,
                        closeImage8: ImageConstant.imgTelevision,
                        contrastImage6: ImageConstant.imgTelevision,
                        contrastImage7: ImageConstant.imgTelevision,
                        closeImage9: ImageConstant.imgTelevision,
                        closeImage10: ImageConstant.imgTelevision,
                        closeImage11: ImageConstant.imgTelevision,
                        contrastImage8: ImageConstant.imgTelevision,
                        contrastImage9: ImageConstant.imgTelevision,
                        closeImage12: ImageConstant.imgTelevision,
                        closeImage13: ImageConstant.imgTelevision)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnSelectedRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 24.v),
      decoration: AppDecoration.outlineOnPrimaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 50.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 45.h),
                        child: Row(
                          children: [
                            Icon(Icons.circle, color: AppColors.primary),
                            Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(
                                "Selected",
                                style: TextStyle(
                                    fontSize: 14.0, color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: AppColors.primary),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "Not Available",
                              style: TextStyle(
                                  fontSize: 14.0, color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.only(right: 40.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 45.h),
                        child: Row(
                          children: [
                            Icon(Icons.circle, color: AppColors.primary),
                            Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(
                                "VIP (\$150)",
                                style: TextStyle(
                                    fontSize: 14.0, color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: AppColors.primary),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "Regular (50)",
                              style: TextStyle(
                                  fontSize: 14.0, color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 31.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 4.v),
              decoration: AppDecoration.fillGray500
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.h, top: 3.v, bottom: 2.v),
                    child: Text("4/3 row",
                        style:
                            CustomTextStyles.bodySmallPoppinsPrimaryContainer),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame11902Primarycontainer,
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                    margin: EdgeInsets.only(left: 13.h, top: 2.v, bottom: 3.v),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 35.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
                  decoration: AppDecoration.fillGray500.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.v),
                      Text("Total Price",
                          style: CustomTextStyles
                              .bodySmallPoppinsPrimaryContainer),
                      Text("\$52",
                          style: CustomTextStyles.titleMediumPrimaryContainer)
                    ],
                  ),
                ),
                CustomElevatedButton(
                  buttonStyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                    ),
                  ),
                  width: 216.h,
                  text: "Proceed to Pay",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameRow(
    BuildContext context, {
    required String closeImage,
    required String closeImage1,
    required String contrastImage,
    required String contrastImage1,
    required String closeImage2,
    required String closeImage3,
    required String closeImage4,
    required String contrastImage2,
    required String contrastImage3,
    required String closeImage5,
    required String closeImage6,
    required String contrastImage4,
    required String contrastImage5,
    required String closeImage7,
    required String closeImage8,
    required String contrastImage6,
    required String contrastImage7,
    required String closeImage9,
    required String closeImage10,
    required String closeImage11,
    required String contrastImage8,
    required String contrastImage9,
    required String closeImage12,
    required String closeImage13,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: closeImage, height: 6.adaptSize, width: 6.adaptSize),
      CustomImageView(
          imagePath: closeImage1,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage1,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage2,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage3,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 18.h)),
      CustomImageView(
          imagePath: closeImage4,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage2,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage3,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage5,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage6,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage4,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage5,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage7,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage8,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage6,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage7,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage9,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage10,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage11,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 18.h)),
      CustomImageView(
          imagePath: contrastImage8,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: contrastImage9,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage12,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h)),
      CustomImageView(
          imagePath: closeImage13,
          height: 6.adaptSize,
          width: 6.adaptSize,
          margin: EdgeInsets.only(left: 5.h))
    ]);
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
