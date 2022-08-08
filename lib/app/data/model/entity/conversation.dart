import 'package:dump/app/data/model/entity/read_by_recipients.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation{

  Conversation({
    required this.id,
    required this.messageId,
    required this.roomName,
    required this.chatRoomId,
    required this.message,
    required this.type,
    required this.postedByUser,
    required this.readByRecipients,
    required this.roomInfo,
    required this.createdAt,
    required this.unreadMessages
  });

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'messageId')
  String messageId;
  @JsonKey(name: 'roomName')
  String roomName;
  @JsonKey(name: 'chatRoomId')
  String chatRoomId;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'postedByUser')
  UserDetails postedByUser;
  @JsonKey(name: 'readByRecipients')
  List<ReadByRecipients> readByRecipients;
  @JsonKey(name: 'roomInfo')
  List<List<UserDetails>> roomInfo;
  @JsonKey(name: 'createdAt')
  String createdAt;
  @JsonKey(name: 'unreadMessages')
  int unreadMessages;
}