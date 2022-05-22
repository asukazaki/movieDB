import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviedb/api/search_movie/ApiError.dart';

part 'NetworkError.freezed.dart';

@freezed
class NetworkError with _$NetworkError {
  const factory NetworkError.requestCancelled() = _RequestCancelled;

  const factory NetworkError.unauthorisedRequest() = _UnauthorisedRequest;

  const factory NetworkError.requestError({ required ApiError apiError }) = _RequestError;

  const factory NetworkError.serviceUnavailable() = _ServiceUnavailable;

  const factory NetworkError.sendTimeout() = _SendTimeout;

  const factory NetworkError.noInternetConnection() = _NoInternetConnection;

  const factory NetworkError.unexpectedError() = _UnexpectedError;

  const NetworkError._();

  static NetworkError getApiError(error) {
    if (error is Exception) {
      try {
        NetworkError? _error;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              _error = const NetworkError.sendTimeout();
              break;
            case DioErrorType.cancel:
              _error = const NetworkError.requestCancelled();
              break;
            case DioErrorType.response:
              final statusCode = error.response?.statusCode;
              if (statusCode == null) {
                _error = const NetworkError.unexpectedError();
              }
              if (400 <= statusCode! && statusCode < 500) {
                _error = NetworkError.requestError(apiError: ApiError.fromJson(error.response?.data));
              } else if (500 <= statusCode) {
                _error = const NetworkError.serviceUnavailable();
              }
              break;
            default:
              _error = const NetworkError.unexpectedError();
          }
        } else if (error is SocketException) {
          _error = const NetworkError.noInternetConnection();
        } else {
          _error = const NetworkError.unexpectedError();
        }
        return _error ?? const NetworkError.unexpectedError();
      } catch (_) {
        return const NetworkError.unexpectedError();
      }
    } else {
      return const NetworkError.unexpectedError();
    }
  }

  String get errorMessage => when(
      requestCancelled: () => "キャンセルされました",
      unauthorisedRequest: () => "認証エラーです",
      requestError: (ApiError error) => error.statusMessage,
      serviceUnavailable: () => "しばらく時間をおいてから再度お試しください",
      sendTimeout: () => "通信環境の良いところで再度お試しください",
      noInternetConnection: () => "通信環境の良いところで再度お試しください",
      unexpectedError: () => "不明なエラーが発生しました"
  );
}