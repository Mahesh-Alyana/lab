// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomResponse _$CreateRoomResponseFromJson(Map<String, dynamic> json) =>
    CreateRoomResponse(
      success: json['success'] as bool,
      chatRoom: json['chatRoom'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreateRoomResponseToJson(CreateRoomResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'chatRoom': instance.chatRoom,
    };
