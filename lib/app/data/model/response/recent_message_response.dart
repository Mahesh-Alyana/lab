import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/entity/message_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_message_response.g.dart';

@JsonSerializable()
class RecentMessageResponse{

  RecentMessageResponse({
    required this.post,
  });

  factory RecentMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecentMessageResponseToJson(this);

  @JsonKey(name: 'message')
  MessagePost post;
}
