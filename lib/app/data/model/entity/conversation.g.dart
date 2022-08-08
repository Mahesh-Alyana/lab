// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['_id'] as String,
      messageId: json['messageId'] as String,
      roomName: json['roomName'] as String,
      chatRoomId: json['chatRoomId'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      postedByUser:
          UserDetails.fromJson(json['postedByUser'] as Map<String, dynamic>),
      readByRecipients: (json['readByRecipients'] as List<dynamic>)
          .map((e) => ReadByRecipients.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomInfo: (json['roomInfo'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      createdAt: json['createdAt'] as String,
      unreadMessages: json['unreadMessages'] as int,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'messageId': instance.messageId,
      'roomName': instance.roomName,
      'chatRoomId': instance.chatRoomId,
      'message': instance.message,
      'type': instance.type,
      'postedByUser': instance.postedByUser,
      'readByRecipients': instance.readByRecipients,
      'roomInfo': instance.roomInfo,
      'createdAt': instance.createdAt,
      'unreadMessages': instance.unreadMessages,
    };
