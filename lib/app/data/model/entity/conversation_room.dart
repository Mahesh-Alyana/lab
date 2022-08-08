// {
// "_id": "ad665c53fa854fa496790ae5e9dad780",
// "chatRoomId": "514d353116fa43a48a7058545cb9c79b",
// "message": {
// "messageText": "Hello atul, How are you",
// "type": "trainer-to-reader"
// },
// "postedByUser": {
// "_id": "19e3bc592a074d33aa4b67e8679a520b",
// "email": "admin@gmail.com",
// "password": "admin@123",
// "firstName": "Admin",
// "lastName": "User",
// "college": "Dump",
// "mobile": "8539959795",
// "type": "admin",
// "createdAt": "2022-05-01T09:27:37.997Z",
// "updatedAt": "2022-05-01T09:29:22.598Z",
// "__v": 0
// },
// "readByRecipients": [
// {
// "readByUserId": "19e3bc592a074d33aa4b67e8679a520b",
// "readAt": "2022-05-04T14:38:54.013Z"
// }
// ],
// "type": "text",
// "createdAt": "2022-05-04T17:37:04.649Z",
// "updatedAt": "2022-05-04T17:37:04.649Z",
// "__v": 0
// }


import 'package:dump/app/data/model/entity/read_by_recipients.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_room.g.dart';

@JsonSerializable()
class ConversationRoom{

  ConversationRoom({
    required this.id,
    required this.chatRoomId,
    required this.message,
    required this.type,
    required this.postedByUser,
    required this.readByRecipients,
    required this.createdAt,
  });

  factory ConversationRoom.fromJson(Map<String, dynamic> json) =>
      _$ConversationRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationRoomToJson(this);

  @JsonKey(name: '_id')
  String id;
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
}