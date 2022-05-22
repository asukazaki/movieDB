// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'NetworkError.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res> implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(this._value, this._then);

  final NetworkError _value;
  // ignore: unused_field
  final $Res Function(NetworkError) _then;
}

/// @nodoc
abstract class _$RequestCancelledCopyWith<$Res> {
  factory _$RequestCancelledCopyWith(
          _RequestCancelled value, $Res Function(_RequestCancelled) then) =
      __$RequestCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$RequestCancelledCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$RequestCancelledCopyWith<$Res> {
  __$RequestCancelledCopyWithImpl(
      _RequestCancelled _value, $Res Function(_RequestCancelled) _then)
      : super(_value, (v) => _then(v as _RequestCancelled));

  @override
  _RequestCancelled get _value => super._value as _RequestCancelled;
}

/// @nodoc

class _$_RequestCancelled extends _RequestCancelled {
  const _$_RequestCancelled() : super._();

  @override
  String toString() {
    return 'NetworkError.requestCancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RequestCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return requestCancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return requestCancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return requestCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return requestCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled(this);
    }
    return orElse();
  }
}

abstract class _RequestCancelled extends NetworkError {
  const factory _RequestCancelled() = _$_RequestCancelled;
  const _RequestCancelled._() : super._();
}

/// @nodoc
abstract class _$UnauthorisedRequestCopyWith<$Res> {
  factory _$UnauthorisedRequestCopyWith(_UnauthorisedRequest value,
          $Res Function(_UnauthorisedRequest) then) =
      __$UnauthorisedRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthorisedRequestCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$UnauthorisedRequestCopyWith<$Res> {
  __$UnauthorisedRequestCopyWithImpl(
      _UnauthorisedRequest _value, $Res Function(_UnauthorisedRequest) _then)
      : super(_value, (v) => _then(v as _UnauthorisedRequest));

  @override
  _UnauthorisedRequest get _value => super._value as _UnauthorisedRequest;
}

/// @nodoc

class _$_UnauthorisedRequest extends _UnauthorisedRequest {
  const _$_UnauthorisedRequest() : super._();

  @override
  String toString() {
    return 'NetworkError.unauthorisedRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UnauthorisedRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return unauthorisedRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return unauthorisedRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorisedRequest != null) {
      return unauthorisedRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return unauthorisedRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return unauthorisedRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorisedRequest != null) {
      return unauthorisedRequest(this);
    }
    return orElse();
  }
}

abstract class _UnauthorisedRequest extends NetworkError {
  const factory _UnauthorisedRequest() = _$_UnauthorisedRequest;
  const _UnauthorisedRequest._() : super._();
}

/// @nodoc
abstract class _$RequestErrorCopyWith<$Res> {
  factory _$RequestErrorCopyWith(
          _RequestError value, $Res Function(_RequestError) then) =
      __$RequestErrorCopyWithImpl<$Res>;
  $Res call({ApiError apiError});
}

/// @nodoc
class __$RequestErrorCopyWithImpl<$Res> extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$RequestErrorCopyWith<$Res> {
  __$RequestErrorCopyWithImpl(
      _RequestError _value, $Res Function(_RequestError) _then)
      : super(_value, (v) => _then(v as _RequestError));

  @override
  _RequestError get _value => super._value as _RequestError;

  @override
  $Res call({
    Object? apiError = freezed,
  }) {
    return _then(_RequestError(
      apiError: apiError == freezed
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as ApiError,
    ));
  }
}

/// @nodoc

class _$_RequestError extends _RequestError {
  const _$_RequestError({required this.apiError}) : super._();

  @override
  final ApiError apiError;

  @override
  String toString() {
    return 'NetworkError.requestError(apiError: $apiError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestError &&
            const DeepCollectionEquality().equals(other.apiError, apiError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(apiError));

  @JsonKey(ignore: true)
  @override
  _$RequestErrorCopyWith<_RequestError> get copyWith =>
      __$RequestErrorCopyWithImpl<_RequestError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return requestError(apiError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return requestError?.call(apiError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(apiError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return requestError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return requestError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(this);
    }
    return orElse();
  }
}

abstract class _RequestError extends NetworkError {
  const factory _RequestError({required final ApiError apiError}) =
      _$_RequestError;
  const _RequestError._() : super._();

  ApiError get apiError => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RequestErrorCopyWith<_RequestError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ServiceUnavailableCopyWith<$Res> {
  factory _$ServiceUnavailableCopyWith(
          _ServiceUnavailable value, $Res Function(_ServiceUnavailable) then) =
      __$ServiceUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$ServiceUnavailableCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$ServiceUnavailableCopyWith<$Res> {
  __$ServiceUnavailableCopyWithImpl(
      _ServiceUnavailable _value, $Res Function(_ServiceUnavailable) _then)
      : super(_value, (v) => _then(v as _ServiceUnavailable));

  @override
  _ServiceUnavailable get _value => super._value as _ServiceUnavailable;
}

/// @nodoc

class _$_ServiceUnavailable extends _ServiceUnavailable {
  const _$_ServiceUnavailable() : super._();

  @override
  String toString() {
    return 'NetworkError.serviceUnavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ServiceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return serviceUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return serviceUnavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return serviceUnavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class _ServiceUnavailable extends NetworkError {
  const factory _ServiceUnavailable() = _$_ServiceUnavailable;
  const _ServiceUnavailable._() : super._();
}

/// @nodoc
abstract class _$SendTimeoutCopyWith<$Res> {
  factory _$SendTimeoutCopyWith(
          _SendTimeout value, $Res Function(_SendTimeout) then) =
      __$SendTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendTimeoutCopyWithImpl<$Res> extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$SendTimeoutCopyWith<$Res> {
  __$SendTimeoutCopyWithImpl(
      _SendTimeout _value, $Res Function(_SendTimeout) _then)
      : super(_value, (v) => _then(v as _SendTimeout));

  @override
  _SendTimeout get _value => super._value as _SendTimeout;
}

/// @nodoc

class _$_SendTimeout extends _SendTimeout {
  const _$_SendTimeout() : super._();

  @override
  String toString() {
    return 'NetworkError.sendTimeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SendTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return sendTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return sendTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return sendTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }
}

abstract class _SendTimeout extends NetworkError {
  const factory _SendTimeout() = _$_SendTimeout;
  const _SendTimeout._() : super._();
}

/// @nodoc
abstract class _$NoInternetConnectionCopyWith<$Res> {
  factory _$NoInternetConnectionCopyWith(_NoInternetConnection value,
          $Res Function(_NoInternetConnection) then) =
      __$NoInternetConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoInternetConnectionCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$NoInternetConnectionCopyWith<$Res> {
  __$NoInternetConnectionCopyWithImpl(
      _NoInternetConnection _value, $Res Function(_NoInternetConnection) _then)
      : super(_value, (v) => _then(v as _NoInternetConnection));

  @override
  _NoInternetConnection get _value => super._value as _NoInternetConnection;
}

/// @nodoc

class _$_NoInternetConnection extends _NoInternetConnection {
  const _$_NoInternetConnection() : super._();

  @override
  String toString() {
    return 'NetworkError.noInternetConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoInternetConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return noInternetConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return noInternetConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }
}

abstract class _NoInternetConnection extends NetworkError {
  const factory _NoInternetConnection() = _$_NoInternetConnection;
  const _NoInternetConnection._() : super._();
}

/// @nodoc
abstract class _$UnexpectedErrorCopyWith<$Res> {
  factory _$UnexpectedErrorCopyWith(
          _UnexpectedError value, $Res Function(_UnexpectedError) then) =
      __$UnexpectedErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnexpectedErrorCopyWithImpl<$Res>
    extends _$NetworkErrorCopyWithImpl<$Res>
    implements _$UnexpectedErrorCopyWith<$Res> {
  __$UnexpectedErrorCopyWithImpl(
      _UnexpectedError _value, $Res Function(_UnexpectedError) _then)
      : super(_value, (v) => _then(v as _UnexpectedError));

  @override
  _UnexpectedError get _value => super._value as _UnexpectedError;
}

/// @nodoc

class _$_UnexpectedError extends _UnexpectedError {
  const _$_UnexpectedError() : super._();

  @override
  String toString() {
    return 'NetworkError.unexpectedError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UnexpectedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function() unauthorisedRequest,
    required TResult Function(ApiError apiError) requestError,
    required TResult Function() serviceUnavailable,
    required TResult Function() sendTimeout,
    required TResult Function() noInternetConnection,
    required TResult Function() unexpectedError,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
  }) {
    return unexpectedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function()? unauthorisedRequest,
    TResult Function(ApiError apiError)? requestError,
    TResult Function()? serviceUnavailable,
    TResult Function()? sendTimeout,
    TResult Function()? noInternetConnection,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestCancelled value) requestCancelled,
    required TResult Function(_UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(_RequestError value) requestError,
    required TResult Function(_ServiceUnavailable value) serviceUnavailable,
    required TResult Function(_SendTimeout value) sendTimeout,
    required TResult Function(_NoInternetConnection value) noInternetConnection,
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestCancelled value)? requestCancelled,
    TResult Function(_UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(_RequestError value)? requestError,
    TResult Function(_ServiceUnavailable value)? serviceUnavailable,
    TResult Function(_SendTimeout value)? sendTimeout,
    TResult Function(_NoInternetConnection value)? noInternetConnection,
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedError extends NetworkError {
  const factory _UnexpectedError() = _$_UnexpectedError;
  const _UnexpectedError._() : super._();
}
