// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_files_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFilesResponse _$GetFilesResponseFromJson(Map<String, dynamic> json) =>
    GetFilesResponse(
      message: json['message'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GetFilesResponseToJson(GetFilesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'files': instance.files,
    };
