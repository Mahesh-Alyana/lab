// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomMessageResponse _$RoomMessageResponseFromJson(Map<String, dynamic> json) =>
    RoomMessageResponse(
      success: json['success'] as bool,
      conversation: (json['conversation'] as List<dynamic>)
          .map((e) => ConversationRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomMessageResponseToJson(
        RoomMessageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'conversation': instance.conversation,
      'users': instance.users,
    };
