import 'package:json_annotation/json_annotation.dart';

part 'ApiError.g.dart';

@JsonSerializable()
class ApiError {
  ApiError(this.statusCode, this.statusMessage, this.success);
  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'status_message')
  final String statusMessage;
  @JsonKey(name: 'success')
  final bool success;
}