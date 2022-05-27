
import 'package:dio/dio.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';
import 'DiscoverResponse.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "discover/movie";
const String apiKey = String.fromEnvironment("API_KEY");
const String popularityDesc = "popularity.desc";
const String voteCountDesc = "vote_count.desc";

class DiscoverRepository {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  DiscoverRepository()  {
    var dio = Dio();

    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<DiscoverResponse>> fetchByPopularity({int page = 1}) async {
    _defaultParams.addAll(
        {
          "sort_by" : popularityDesc,
          "page" : page,
        });
    try {
      final response = await dioClient.get(searchUrl, _defaultParams);
      DiscoverResponse result = DiscoverResponse.fromJson(response);
      return ApiResult.success(data: result);
      return await dioClient.get(searchUrl, _defaultParams).then((value) => ApiResult.success(data: DiscoverResponse.fromJson(value)));

      // return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
      // return SearchApiResult(false, null);
    }
  }

  Future<ApiResult<DiscoverResponse>> fetchByVoteCount({int page = 1}) async {
    _defaultParams.addAll(
        {
          "sort_by" : voteCountDesc,
          "page" : page,
        });
    try {
      return await dioClient.get(searchUrl, _defaultParams).then((value) => ApiResult.success(data: DiscoverResponse.fromJson(value)));

      // return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
      // return SearchApiResult(false, null);
    }
  }
}