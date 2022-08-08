// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePost _$MessagePostFromJson(Map<String, dynamic> json) => MessagePost(
      id: json['_id'] as String,
      postId: json['postId'] as String,
      chatRoomId: json['chatRoomId'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      postedByUser:
          UserDetails.fromJson(json['postedByUser'] as Map<String, dynamic>),
      readByRecipients: (json['readByRecipients'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      chatRoomInfo: (json['chatRoomInfo'] as List<dynamic>)
          .map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$MessagePostToJson(MessagePost instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'postId': instance.postId,
      'chatRoomId': instance.chatRoomId,
      'message': instance.message,
      'type': instance.type,
      'postedByUser': instance.postedByUser,
      'readByRecipients': instance.readByRecipients,
      'createdAt': instance.createdAt,
      'chatRoomInfo': instance.chatRoomInfo,
    };
