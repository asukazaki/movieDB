// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      json['status_code'] as int,
      json['status_message'] as String,
      json['success'] as bool,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'success': instance.success,
    };
