import 'package:go_router/go_router.dart';
import 'package:movieapp/core/errors/error_screen.dart';
import 'package:movieapp/core/services/service_locator.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/presentation/movie_details/models/movie_detail_model.dart';
import 'package:movieapp/presentation/movie_details/models/video_model.dart';
import 'package:movieapp/presentation/movie_details/widgets/bloc/video_player_bloc.dart';
import 'package:movieapp/presentation/movie_details/widgets/video_player_widget.dart';
import '../../core/resources/app_colors.dart';
import 'bloc/movie_detail_bloc.dart';
import 'models/chipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';
import 'package:movieapp/widgets/custom_elevated_button.dart';
import 'package:movieapp/widgets/custom_outlined_button.dart';

import 'widgets/bloc/video_player_state.dart';
import 'widgets/chipview_item_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key, required this.movieID}) : super(key: key);
  final String? movieID;

  // static Widget builder(BuildContext context) {
  //   return BlocProvider<FiveBloc>(
  //       create: (context) => FiveBloc(FiveState(fiveModelObj: FiveModel()))
  //         ..add(FiveInitialEvent()),
  //       child: FiveScreen());
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    print("MovieID: $movieID");
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieID)),

      // MultiBlocProvider(
      //   providers: [
      //     BlocProvider<MovieDetailsBloc>(
      //       create: (context) =>
      //           sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieID)),
      //     ),
      //     BlocProvider(
      //       create: (_) =>
      //           sl<VideoPlayerBloc>()..add(GetMovieTrailerEvent(movieID)),
      //     ),
      //   ],
      child: Scaffold(
          backgroundColor: appTheme.whiteA700,
          body: BlocBuilder<MovieDetailsBloc, MovieDetailState>(
              builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              case RequestStatus.loaded:
                return _body(context: context, model: state.movieDetailsModel);

              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<MovieDetailsBloc>()
                        .add(GetMovieDetailsEvent(movieID));
                  },
                );
              case null:
                return Container();
            }
          })),
    );
  }

  Widget _body({context, MovieDetailModel? model}) {
    print("MovieID View: ${model.toString()}");
    return SizedBox(
      width: double.maxFinite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            height: 422.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.center, children: [
              CustomImageView(
                  imagePath:
                      model?.backdropUrl ?? ImageConstant.imgRectangle2230,
                  height: 422.v,
                  width: 375.h,
                  alignment: Alignment.center),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 422.v,
                      width: double.maxFinite,
                      child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildFrameRow(context, model),
                            _buildThreeColumn(context, model)
                          ])))
            ])),
        SizedBox(height: 25.v),
        Padding(
            padding: EdgeInsets.only(left: 40.h),
            child: Text("Genre",
                style: CustomTextStyles.titleMediumPrimaryContainer_1)),
        SizedBox(height: 11.v),
        _buildChipView(context, model?.genres ?? []),
        SizedBox(height: 22.v),
        Opacity(
            opacity: 0.05,
            child: Align(
                alignment: Alignment.center,
                child: Divider(indent: 40.h, endIndent: 40.h))),
        SizedBox(height: 11.v),
        Padding(
            padding: EdgeInsets.only(left: 40.h),
            child: Text("Overview",
                style: CustomTextStyles.titleMediumPrimaryContainer_1)),
        SizedBox(height: 12.v),
        Align(
            alignment: Alignment.center,
            child: Container(
                width: 294.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: Text(model?.overview ?? '',
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmallPoppinsGray50001
                        .copyWith(height: 1.60)))),
        SizedBox(height: 5.v),
      ]),
    );
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context, MovieDetailModel? model) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 302.v),
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.v),
        decoration: AppDecoration.gradientErrorContainerToErrorContainer1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
                imagePath: model?.backdropUrl,
                height: 30.adaptSize,
                width: 30.adaptSize,
                margin: EdgeInsets.only(bottom: 60.v),
                onTap: () {
                  onTapImgArrowLeft(context);
                }),
            Padding(
                padding: EdgeInsets.only(left: 15.h, top: 3.v, bottom: 62.v),
                child: Text("Watch", style: theme.textTheme.titleMedium))
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThreeColumn(BuildContext context, MovieDetailModel? model) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 66.h, vertical: 34.v),
            decoration: AppDecoration.gradientErrorContainerToErrorContainer1,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 110.v),
                  CustomImageView(
                      imagePath: model!.posterUrl, height: 30.v, width: 102.h),
                  SizedBox(height: 5.v),
                  Text('${model.releaseDate!}',
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 11.v),
                  CustomElevatedButton(
                      text: 'Get Tickets',
                      onPressed: () {
                        onTapGetTickets(context);
                      }),
                  SizedBox(height: 10.v),
                  CustomOutlinedButton(
                    text: 'Watch Trailer',
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: AppColors().whiteA700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                          builder: (_) {
                            return BlocBuilder<VideoPlayerBloc,
                                VideoPlayerState>(
                              builder: (context, state) {
                                String videoKey = "qZ40Z62tcXM";
                                for (VideoModel model in state.videoList!) {
                                  if (model.type!
                                      .toLowerCase()
                                      .contains("trailer")) {
                                    videoKey = model.ytKey!;
                                    break;
                                  }
                                }
                                return VideoPlayerWideget(videoId: videoKey);
                              },
                            );
                          });
                    },
                  )
                ])));
  }

  /// Section Widget
  Widget _buildChipView(BuildContext context, List<Genres> genreList) {
    return Padding(
      padding: EdgeInsets.only(left: 40.h),
      child: Wrap(
        runSpacing: 5.v,
        spacing: 5.h,
        children: List<Widget>.generate(genreList.length, (index) {
          Genres genres = genreList[index];
          ChipviewItemModel model = ChipviewItemModel(action: genres.name);
          return ChipviewItemWidget(model, onSelectedChipView: (value) {
            context
                .read<MovieDetailsBloc>()
                .add(UpdateChipViewEvent(index: index, isSelected: value));
          });
        }),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Navigates to the sixTabContainerScreen when the action is triggered.
  onTapGetTickets(BuildContext context) {
    context.pushNamed(AppRoutes.seatBookingDetailsRoute);
  }
}
