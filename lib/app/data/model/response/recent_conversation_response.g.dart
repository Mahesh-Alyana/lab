// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentConversationResponse _$RecentConversationResponseFromJson(
        Map<String, dynamic> json) =>
    RecentConversationResponse(
      success: json['success'] as bool,
      conversation: (json['conversation'] as List<dynamic>)
          .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecentConversationResponseToJson(
        RecentConversationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'conversation': instance.conversation,
    };
