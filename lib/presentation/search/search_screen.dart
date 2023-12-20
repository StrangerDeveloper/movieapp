import 'package:movieapp/core/resources/app_colors.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/widgets/custom_search_view.dart';

import 'bloc/search_bloc.dart';
import 'models/grid_item_model.dart';
import 'models/search_result_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

import 'widgets/grid_item_widget.dart';
import 'widgets/no_result.dart';
import 'widgets/search_text.dart';

class SeachScreen extends StatelessWidget {
  SeachScreen({Key? key}) : super(key: key);

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // static Widget builder(BuildContext context) {
  //   return BlocProvider<TwoBloc>(
  //     create: (context) => TwoBloc(TwoState(
  //       twoModelObj: TwoModel(),
  //     ))
  //       ..add(TwoInitialEvent()),
  //     child: TwoScreen(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        //appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomSearchView(
                width: 334.h,
                controller: TextEditingController(),
                hintText: "Tv shows, Movies and more",
                hintStyle: CustomTextStyles.bodyMediumPrimaryContainer,
              ),
              SizedBox(height: 30.v),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                switch (state.status) {
                  case SearchRequestStatus.empty:
                    return const SearchText();
                  case SearchRequestStatus.loading:
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ));
                  case SearchRequestStatus.loaded:
                    return _buildSearchGrid(results: state.searchResult);
                  case SearchRequestStatus.error:
                    return const Expanded(child: Text('Error'));
                  case SearchRequestStatus.noResults:
                    return Column(
                      children: [
                        const NoResult(),
                        _buildGrid(context, state.gridItemList)
                      ],
                    );
                  case null:
                    return _buildGrid(context, state.gridItemList);
                }
              }),
              //_buildGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     centerTitle: true,
  //     title: BlocSelector<TwoBloc, TwoState, TextEditingController?>(
  //       selector: (state) => state.searchController,
  //       builder: (context, searchController) {
  //         return AppbarTitleSearchview(
  //           hintText: "Tv Shows",
  //           controller: searchController,
  //         );
  //       },
  //     ),
  //     styleType: Style.bgOutline,
  //   );
  // }

  /// Section Widget
  Widget _buildGrid(BuildContext context, List<GridItemModel> list) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 101.v,
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          GridItemModel model = list[index];
          return GridItemWidget(model);
        },
      ),
    );
  }

  Widget _buildSearchGrid({List<SearchResultItemModel>? results}) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: results!.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return _gridViewCard(context, results[index]);
        },
      ),
    );
  }

  Widget _gridViewCard(context, SearchResultItemModel? item) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.movieDetailsRoute,
                params: {'movieId': item!.tmdbID.toString()});
            // : context.pushNamed(AppRoutes.,
            //     params: {'tvShowId': item.tmdbID.toString()});
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomImageView(
                imagePath: item!.posterUrl,
                width: double.infinity,
                height: 150.v,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
