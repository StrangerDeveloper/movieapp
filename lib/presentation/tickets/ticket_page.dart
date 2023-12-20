import 'package:go_router/go_router.dart';

import 'bloc/ticket_bloc.dart';
import 'models/ticket_item_model.dart';
import 'models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/widgets/custom_elevated_button.dart';

import 'widgets/ticket_item_widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => TicketBloc(
            TicketState())
          ..add(SixInitialEvent()),
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(children: [
            SizedBox(height: 38.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSelectSeats(context),
                      SizedBox(height: 219.v),
                      CustomElevatedButton(
                          text: "Select Seat",
                          margin: EdgeInsets.only(left: 6.h, right: 26.h),
                          onPressed: () {
                            onTapSelectSeats(context);
                          })
                    ]),
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  /// Section Widget
  Widget _buildSelectSeats(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("12:30", style: CustomTextStyles.labelLargePrimaryContainer_1),
        Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Text("Cinetech Hall 1",
                style: CustomTextStyles.bodySmallPoppinsGray50001)),
        Spacer(),
        Text("13:30", style: CustomTextStyles.labelLargePrimaryContainer_1),
        Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text("Cinetech Hall 2",
                style: CustomTextStyles.bodySmallPoppinsGray50001))
      ]),
      SizedBox(height: 5.v),
      Column(children: [
        SizedBox(
            height: 145.v,
            child: BlocSelector<TicketBloc, TicketState, TicketModel?>(
                selector: (state) => state.ticketModel,
                builder: (context, sixModelObj) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10.h);
                      },
                      itemCount: sixModelObj?.ticketItemList!.length ?? 0,
                      itemBuilder: (context, index) {
                        TicketItemModel model =
                            sixModelObj?.ticketItemList![index] ??
                                TicketItemModel();
                        return TicketItemWidget(model);
                      });
                })),
        SizedBox(height: 10.v),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "From", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "50 \$",
                    style: CustomTextStyles.labelLargePrimaryContainerBold),
                TextSpan(
                    text: "OR", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "2500",
                    style: CustomTextStyles.labelLargePrimaryContainerBold)
              ]),
              textAlign: TextAlign.left),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "From", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "75 \$",
                    style: CustomTextStyles.labelLargePrimaryContainerBold),
                TextSpan(
                    text: "OR", style: CustomTextStyles.labelLargeGray50001),
                TextSpan(text: " "),
                TextSpan(
                    text: "3000 Bonus",
                    style: CustomTextStyles.labelLargePrimaryContainerBold)
              ]),
              textAlign: TextAlign.left)
        ])
      ])
    ]);
  }

  /// Navigates to the sevenScreen when the action is triggered.
  onTapSelectSeats(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.sevenScreen,
    // );

    context.pushNamed(AppRoutes.seatBookingDetailsRoute);
  }
}
