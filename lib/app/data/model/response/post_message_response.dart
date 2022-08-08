import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/entity/message_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_message_response.g.dart';

@JsonSerializable()
class PostMessageResponse{

  PostMessageResponse({
    required this.success,
    required this.post,
  });

  factory PostMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$PostMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostMessageResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'post')
  MessagePost post;
}
