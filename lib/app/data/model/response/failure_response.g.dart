// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureResponse _$FailureResponseFromJson(Map<String, dynamic> json) =>
    FailureResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FailureResponseToJson(FailureResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
