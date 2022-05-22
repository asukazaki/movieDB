
import 'package:dio/dio.dart';
import 'package:moviedb/api/detail/MovieDetailCreditsResponse.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "movie";
const String apiKey = String.fromEnvironment("API_KEY");

class MovieDetailCreditsRepository {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  MovieDetailCreditsRepository()  {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<MovieDetailCreditsResponse>> fetch(int id) async {
    final url = searchUrl + "/${id.toString()}/credits";
    try {
      return await dioClient.get(url, _defaultParams).then((value) => ApiResult.success(data: MovieDetailCreditsResponse.fromJson(value)));
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
    }
  }
}