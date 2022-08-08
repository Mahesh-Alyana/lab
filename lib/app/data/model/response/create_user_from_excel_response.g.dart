// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_from_excel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserFromExcelResponse _$CreateUserFromExcelResponseFromJson(
        Map<String, dynamic> json) =>
    CreateUserFromExcelResponse(
      success: json['success'] as bool,
      result: (json['result'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CreateUserFromExcelResponseToJson(
        CreateUserFromExcelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };
