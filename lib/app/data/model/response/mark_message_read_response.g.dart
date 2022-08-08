// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_message_read_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkMessageReadResponse _$MarkMessageReadResponseFromJson(
        Map<String, dynamic> json) =>
    MarkMessageReadResponse(
      success: json['success'] as bool,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MarkMessageReadResponseToJson(
        MarkMessageReadResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
