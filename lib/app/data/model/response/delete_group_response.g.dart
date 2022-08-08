// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteGroupResponse _$DeleteGroupResponseFromJson(Map<String, dynamic> json) =>
    DeleteGroupResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      deletedMessagesCount: json['deletedMessagesCount'] as int,
      deletedRoomsCount: json['deletedRoomsCount'] as int,
    );

Map<String, dynamic> _$DeleteGroupResponseToJson(
        DeleteGroupResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'deletedRoomsCount': instance.deletedRoomsCount,
      'deletedMessagesCount': instance.deletedMessagesCount,
    };
