// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationRoom _$ConversationRoomFromJson(Map<String, dynamic> json) =>
    ConversationRoom(
      id: json['_id'] as String,
      chatRoomId: json['chatRoomId'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      postedByUser:
          UserDetails.fromJson(json['postedByUser'] as Map<String, dynamic>),
      readByRecipients: (json['readByRecipients'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ConversationRoomToJson(ConversationRoom instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'chatRoomId': instance.chatRoomId,
      'message': instance.message,
      'type': instance.type,
      'postedByUser': instance.postedByUser,
      'readByRecipients': instance.readByRecipients,
      'createdAt': instance.createdAt,
    };
