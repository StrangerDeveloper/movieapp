// ignore_for_file: must_be_immutable

part of 'search_bloc.dart';

class SearchState extends Equatable {
  SearchState({
    this.searchResult = const [],
    this.status,
    this.message,
    this.gridItemList = const [],
  });

  final List<SearchResultItemModel> searchResult;
  final SearchRequestStatus? status;
  final String? message;
  final List<GridItemModel> gridItemList;

  @override
  List<Object?> get props => [searchResult, status, message, gridItemList];

  SearchState copyWith(
      {List<SearchResultItemModel>? searchResult,
      SearchRequestStatus? status,
      String? message,
      List<GridItemModel>? gridItemList}) {
    return SearchState(
      searchResult: searchResult ?? this.searchResult,
      status: status ?? this.status,
      message: message ?? this.message,
      gridItemList: gridItemList ?? this.gridItemList,
    );
  }
}
