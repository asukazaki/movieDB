import 'package:freezed_annotation/freezed_annotation.dart';


import 'dart:core';

import 'NetworkError.dart';

part 'ApiResult.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({ required T data}) = Success<T>;

  const factory ApiResult.failure({ required NetworkError error}) = Failure<T>;
}