// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersCreateResponse _$UsersCreateResponseFromJson(Map<String, dynamic> json) =>
    UsersCreateResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UsersCreateResponseToJson(
        UsersCreateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
