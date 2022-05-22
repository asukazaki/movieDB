import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:core';

import 'NetworkError.dart';

part 'LoadingState.freezed.dart';

@freezed
class LoadingState<T> with _$LoadingState<T> {
  const factory LoadingState.data({ required T data}) = Data<T>;
  const factory LoadingState.loading() = Loading;
  const factory LoadingState.error({ required NetworkError error}) = Failure<T>;
}