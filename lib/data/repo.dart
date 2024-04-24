import 'package:dio/dio.dart';
import 'package:movieapp/core/errors/error_message_model.dart';
import 'package:movieapp/core/errors/exceptions.dart';
import 'package:movieapp/core/network/api_constant.dart';
import 'package:movieapp/presentation/home/models/movie_model.dart';
import 'package:movieapp/presentation/movie_details/models/movie_detail_model.dart';
import 'package:movieapp/presentation/movie_details/models/video_model.dart';
import 'package:movieapp/presentation/search/models/search_result_item_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getUpCommingMovies();
  Future<MovieDetailModel> getMovieDetails(String id);
  Future<List<VideoModel>> getMovieTrailers(String movieId);

  Future<List<SearchResultItemModel>> search(String title);
}

class MovieRepositoryImp extends MovieRepository {
  @override
  Future<List<MovieModel>> getUpCommingMovies() async {
    var params = {"api_key": ApiConstants.apiKey, "language": "en-US"};

    Response response = await Dio()
        .get("${ApiConstants.baseUrl}/movie/upcoming", queryParameters: params);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(String id) async {
    print("Movie detal id $id");
    var params = {"api_key": ApiConstants.apiKey, "language": "en-US"};

    Response response = await Dio()
        .get("${ApiConstants.baseUrl}/movie/$id", queryParameters: params);

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }

  @override
  Future<List<VideoModel>> getMovieTrailers(String movieId) async {
    print("Movie trailer id $movieId");
    var params = {"api_key": ApiConstants.apiKey, "language": "en-US"};

    Response response = await Dio().get(
        "${ApiConstants.baseUrl}/movie/$movieId/videos",
        queryParameters: params);

    if (response.statusCode == 200) {
      print("trailer response ${response.data}");
      return List<VideoModel>.from((response.data['results'] as List)
          .map((e) => VideoModel.fromJson(e)));
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }

  @override
  Future<List<SearchResultItemModel>> search(String title) async {
    var params = {
      "api_key": ApiConstants.apiKey,
      "query": "$title",
    };

    Response response = await Dio()
        .get("${ApiConstants.baseUrl}/search/multi", queryParameters: params);

    if (response.statusCode == 200) {
      return List<SearchResultItemModel>.from((response.data['results'] as List)
          .map((e) => SearchResultItemModel.fromJson(e)));
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }
}
