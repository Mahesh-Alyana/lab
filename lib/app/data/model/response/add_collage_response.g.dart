// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_collage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCollageResponse _$AddCollageResponseFromJson(Map<String, dynamic> json) =>
    AddCollageResponse(
      success: json['success'] as bool,
      collage: json['result'] as dynamic,
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddCollageResponseToJson(AddCollageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.collage,
      'message': instance.message,
    };
