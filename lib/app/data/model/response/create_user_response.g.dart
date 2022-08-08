// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      success: json['success'] as bool,
      user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
      'message': instance.message,
    };
