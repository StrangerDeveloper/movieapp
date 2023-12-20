import 'package:go_router/go_router.dart';
import 'package:movieapp/core/errors/error_screen.dart';
import 'package:movieapp/core/resources/app_colors.dart';
import 'package:movieapp/core/services/service_locator.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/presentation/home/models/movie_model.dart';
import 'package:movieapp/widgets/app_bar/appbar_title.dart';
import 'package:movieapp/widgets/app_bar/appbar_trailing_image.dart';
import 'package:movieapp/widgets/app_bar/custom_app_bar.dart';
import 'bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';
import 'widgets/moviecard_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // static Widget builder(BuildContext context) {
  //   return BlocProvider<HomeBloc>(
  //       create: (context) => sl<HomeBloc>()..add(GetMovieEvent()),
  //       child: HomeScreen());
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocProvider<MovieBloc>(
      create: (context) => sl<MovieBloc>()..add(GetMovieEvent()),
      child: Scaffold(
        backgroundColor: AppColors().whiteA700,
        appBar: _buildAppBar(context),
        body: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );

            case RequestStatus.error:
              return ErrorScreen(
                onTryAgainPressed: () {
                  context.read<MovieBloc>().add(GetMovieEvent());
                },
              );

            case RequestStatus.loaded:
              return MovieWidget(
                moviesList: state.movies,
              );
          }
        }),
      ),
    );
    //           body: Navigator(
    //               key: navigatorKey,
    //               initialRoute: AppRoutes.onePage,
    //               onGenerateRoute: (routeSetting) => PageRouteBuilder(
    //                   pageBuilder: (ctx, ani, ani1) =>
    //                       getCurrentPage(context, routeSetting.name!),
    //                   transitionDuration: Duration(seconds: 0))),
    //           bottomNavigationBar: _buildBottomBar(context)));
    // });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 64.v,
        title: AppbarTitle(text: 'Watch', margin: EdgeInsets.only(left: 22.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSearch,
              margin: EdgeInsets.fromLTRB(13.h, 16.v, 13.h, 11.v),
              onTap: () {
                onTapSearch(context);
              })
        ],
        styleType: Style.bgOutline);
  }

  /// Navigates to the twoScreen when the action is triggered.
  onTapSearch(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.twoScreen,
    // );
    context.pushNamed(AppRoutes.searchRoute);
  }
}

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key, this.moviesList}) : super(key: key);

  final List<MovieModel>? moviesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.separated(
          //physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.v);
          },
          itemCount: moviesList!.length,
          itemBuilder: (context, index) {
            MovieModel model = moviesList![index];
            return MoviecardItemWidget(model,
                onTapImgMovieImage: () => onTapImgMovieImage(context, model));
          }),
    );
  }

  onTapImgMovieImage(BuildContext context, MovieModel model) {
    context.pushNamed(
      AppRoutes.movieDetailsRoute,
      pathParameters: {'movieId': model.tmdbID.toString()},
    );
  }
}
