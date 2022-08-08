// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentMessageResponse _$RecentMessageResponseFromJson(
        Map<String, dynamic> json) =>
    RecentMessageResponse(
      post: MessagePost.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentMessageResponseToJson(
        RecentMessageResponse instance) =>
    <String, dynamic>{
      'message': instance.post,
    };
