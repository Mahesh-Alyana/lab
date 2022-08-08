import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_conversation_response.g.dart';

@JsonSerializable()
class RecentConversationResponse{

  RecentConversationResponse({
    required this.success,
    required this.conversation,
  });

  factory RecentConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecentConversationResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'conversation')
  List<Conversation> conversation;
}
