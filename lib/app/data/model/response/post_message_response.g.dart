// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMessageResponse _$PostMessageResponseFromJson(Map<String, dynamic> json) =>
    PostMessageResponse(
      success: json['success'] as bool,
      post: MessagePost.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostMessageResponseToJson(
        PostMessageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'post': instance.post,
    };
