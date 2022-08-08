// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserDetailsResponse _$GetAllUserDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllUserDetailsResponse(
      success: json['success'] as bool,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserDetailsResponseToJson(
        GetAllUserDetailsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'users': instance.users,
    };
