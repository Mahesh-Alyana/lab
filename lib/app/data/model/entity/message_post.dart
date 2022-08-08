import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_post.g.dart';

@JsonSerializable()
class MessagePost{

  MessagePost({
    required this.id,
    required this.postId,
    required this.chatRoomId,
    required this.message,
    required this.type,
    required this.postedByUser,
    required this.readByRecipients,
    required this.chatRoomInfo,
    required this.createdAt,
  });

  factory MessagePost.fromJson(Map<String, dynamic> json) =>
      _$MessagePostFromJson(json);

  Map<String, dynamic> toJson() => _$MessagePostToJson(this);

  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'postId')
  String postId;
  @JsonKey(name: 'chatRoomId')
  String chatRoomId;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'postedByUser')
  UserDetails postedByUser;
  @JsonKey(name: 'readByRecipients')
  List<Map<String,String>> readByRecipients;
  @JsonKey(name: 'createdAt')
  String createdAt;
  @JsonKey(name: 'chatRoomInfo')
  List<UserDetails> chatRoomInfo;
}