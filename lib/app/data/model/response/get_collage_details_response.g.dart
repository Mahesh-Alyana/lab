// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collage_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollageResponse _$GetCollageResponseFromJson(Map<String, dynamic> json) =>
    GetCollageResponse(
      success: json['success'] as bool,
      collages: (json['collages'] as List<dynamic>)
          .map((e) => Collage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCollageResponseToJson(GetCollageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'collages': instance.collages,
    };
