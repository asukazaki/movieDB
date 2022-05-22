
import 'package:dio/dio.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';
import 'SearchMovieResponse.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "search/movie";
const String apiKey = String.fromEnvironment("API_KEY");

class SearchMovieRepository {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  SearchMovieRepository()  {
    var dio = Dio();

    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<SearchMovieResponse>> fetchMovieList(String searchWord,
      {int page = 1}) async {
    _defaultParams.addAll(
        {
          "query" : Uri.encodeComponent(searchWord),
          "page" : page,
        });
    try {
      // final response = await dioClient.get(searchUrl, _defaultParams);
      // SearchMovieResponse result = SearchMovieResponse.fromJson(response);
      // return SearchApiResult(true, result);
      return await dioClient.get(searchUrl, _defaultParams).then((value) => ApiResult.success(data: SearchMovieResponse.fromJson(value)));

      // return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
      // return SearchApiResult(false, null);
    }
  }
}