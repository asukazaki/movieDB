
import 'package:dio/dio.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';
import 'PersonMovieCreditsResponse.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "person";
const String apiKey = String.fromEnvironment("API_KEY");

class PersonMovieCreditsRepository {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  PersonMovieCreditsRepository()  {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<PersonMovieCreditsResponse>> fetch(int id) async {
    final url = searchUrl + "/${id.toString()}/movie_credits";
    try {
      // final response = await dioClient.get(url, _defaultParams);
      // PersonMovieCreditsResponse result = PersonMovieCreditsResponse.fromJson(response);
      // return ApiResult.success(data: result);

      return await dioClient.get(url, _defaultParams).then((value) => ApiResult.success(data: PersonMovieCreditsResponse.fromJson(value)));

      // return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
      // return SearchApiResult(false, null);
    }
  }
}