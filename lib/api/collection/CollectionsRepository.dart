
import 'package:dio/dio.dart';

import '../ApiResult.dart';
import '../DioClient.dart';
import '../NetworkError.dart';
import 'CollectionsResponse.dart';

const String baseUrl = "https://api.themoviedb.org/3/";
const String searchUrl = "collection";
const String apiKey = String.fromEnvironment("API_KEY");

class CollectionsReporitory {
  late DioClient dioClient;

  final Map<String, dynamic> _defaultParams = {
    "api_key" : apiKey,
    "language" : "ja-en",
    "include_adult" : false,
  };

  CollectionsReporitory()  {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
  }

  Future<ApiResult<CollectionsResponse>> fetch(int id) async {
    final url = searchUrl + "/${id.toString()}";
    try {
      return await dioClient.get(url, _defaultParams).then((value) => ApiResult.success(data: CollectionsResponse.fromJson(value)));
    } catch (e) {
      return ApiResult.failure(error: NetworkError.getApiError(e));
    }
  }
}