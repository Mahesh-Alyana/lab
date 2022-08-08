// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['_id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      college: json['college'] as String,
      mobile: json['mobile'] as String,
      type: json['type'] as String,
      createdAt: json['createdAt'] as String,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'college': instance.college,
      'mobile': instance.mobile,
      'type': instance.type,
      'createdAt': instance.createdAt,
      '__v': instance.v,
    };
