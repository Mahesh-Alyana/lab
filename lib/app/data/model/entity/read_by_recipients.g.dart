// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_by_recipients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadByRecipients _$ReadByRecipientsFromJson(Map<String, dynamic> json) =>
    ReadByRecipients(
      readByUserId: json['readByUserId'] as String,
      readAt: json['readAt'] as String,
      readByUser: (json['readByUser'] as List<dynamic>)
          .map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReadByRecipientsToJson(ReadByRecipients instance) =>
    <String, dynamic>{
      'readByUserId': instance.readByUserId,
      'readAt': instance.readAt,
      'readByUser': instance.readByUser,
    };
