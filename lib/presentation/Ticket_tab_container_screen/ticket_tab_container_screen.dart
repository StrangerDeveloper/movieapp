import 'package:movieapp/presentation/Tickets/ticket_page.dart';

import 'bloc/ticket_tab_container_bloc.dart';
import 'models/ticket_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

class TicketTabContainerScreen extends StatefulWidget {
  const TicketTabContainerScreen({Key? key}) : super(key: key);

  @override
  TicketTabContainerScreenState createState() =>
      TicketTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class TicketTabContainerScreenState extends State<TicketTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketTabContainerBloc>(
      create: (context) => TicketTabContainerBloc(
        TicketTabContainerState(
          ticketTabContainerModelObj: TicketTabContainerModel(),
        ),
      )..add(TicketTabContainerInitialEvent()),
      child: body(),
    );
  }

  Widget body() {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<TicketTabContainerBloc, TicketTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildPlaylist(context),
                  SizedBox(height: 92.v),
                  _buildClientTestimonials(context),
                  SizedBox(
                    height: 532.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        TicketPage(),
                        TicketPage(),
                        TicketPage(),
                        TicketPage(),
                        TicketPage(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaylist(BuildContext context) {
    return SizedBox(
      height: 76.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
              decoration: AppDecoration.outlineOnPrimaryContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowLeftErrorcontainer,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    margin: EdgeInsets.only(top: 2.v, bottom: 18.v),
                    onTap: () {
                      onTapImgArrowLeft(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 53.h, top: 7.v),
                    child: Column(
                      children: [
                        Text("Movie Name",
                            style:
                                CustomTextStyles.titleMediumPrimaryContainer_1),
                        SizedBox(height: 1.v),
                        Text("In Theater In Jan",
                            style: CustomTextStyles.labelLargePrimary_1)
                      ],
                    ),
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

  /// Section Widget
  Widget _buildClientTestimonials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text("Date",
                style: CustomTextStyles.titleMediumPrimaryContainer_1)),
        SizedBox(height: 11.v),
        Container(
          height: 32.v,
          width: 355.h,
          child: TabBar(
            controller: tabviewController,
            isScrollable: true,
            labelColor: appTheme.whiteA700,
            labelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
            unselectedLabelColor: theme.colorScheme.primaryContainer,
            unselectedLabelStyle: TextStyle(
                fontSize: 12.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
            indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10.h),
                boxShadow: [
                  BoxShadow(
                      color: appTheme.lightBlue40044,
                      spreadRadius: 2.h,
                      blurRadius: 2.h,
                      offset: Offset(0, 0))
                ]),
            tabs: [
              Tab(child: Text("Mar 5")),
              Tab(child: Text("Mar 6")),
              Tab(child: Text("Mar 7")),
              Tab(child: Text("Mar 8")),
              Tab(child: Text("Mar 9"))
            ],
          ),
        ),
      ],
    );
  }

  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
