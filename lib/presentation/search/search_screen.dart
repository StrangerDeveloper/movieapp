import 'package:movieapp/core/resources/app_colors.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/widgets/custom_search_view.dart';

import '../../core/services/service_locator.dart';
import 'bloc/search_bloc.dart';
import 'models/grid_item_model.dart';
import 'models/search_result_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

import 'widgets/grid_item_widget.dart';
import 'widgets/no_result.dart';

class SeachScreen extends StatelessWidget {
  SeachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocProvider<SearchBloc>(
      create: (context) => sl<SearchBloc>()..add(GetSearchResultsEvent("")),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomSearchView(
                    width: 334.h,
                    controller: TextEditingController(),
                    hintText: "Tv shows, Movies and more",
                    hintStyle: CustomTextStyles.bodyMediumPrimaryContainer,
                    onSubmitted: (value) {
                      context
                          .read<SearchBloc>()
                          .add(GetSearchResultsEvent(value));
                    },
                  ),
                  SizedBox(height: 30.v),
                  _buildSearchResultsText(state.searchResult),
                  BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                    switch (state.status) {
                      case SearchRequestStatus.empty:
                        return Expanded(
                          child: _buildGrid(context, state.gridItemList),
                        );
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
                        return const NoResult();
                      case null:
                        return _buildGrid(context, state.gridItemList);
                    }
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultsText(List<SearchResultItemModel>? results) {
    if (results != null && results.isNotEmpty) {
      return Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Results found: ${results.length}",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            //color: AppColors.primary,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

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
        padding: const EdgeInsets.symmetric(vertical: 1),
        itemCount: results!.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          return _gridViewCard(context, results[index]);
        },
      ),
    );
  }

  Widget _gridViewCard(context, SearchResultItemModel? item) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomImageView(
              imagePath: item!.posterUrl,
              width: 100,
              height: 150,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  "Your message here Your message here Your message here Your message here",
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
