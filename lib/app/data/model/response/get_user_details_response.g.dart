// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailsResponse _$GetUserDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserDetailsResponse(
      success: json['success'] as bool,
      user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDetailsResponseToJson(
        GetUserDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
    };
