
import 'package:dio/dio.dart';
import 'package:moviedb/api/detail/MovieDetailResponse.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "movie";
const String apiKey = String.fromEnvironment("API_KEY");

class MovieDetailRepository {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  MovieDetailRepository()  {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<MovieDetailResponse>> fetch(int id) async {
    final url = searchUrl + "/${id.toString()}";
    try {
      // final response = await dioClient.get(url, _defaultParams);
      // MovieDetailResponse result = MovieDetailResponse.fromJson(response);
      // return ApiResult.success(data: result);

      return await dioClient.get(url, _defaultParams).then((value) => ApiResult.success(data: MovieDetailResponse.fromJson(value)));

      // return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
      // return SearchApiResult(false, null);
    }
  }
}