import 'package:dump/app/data/model/entity/conversation_room.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_message_response.g.dart';

@JsonSerializable()
class RoomMessageResponse{

  RoomMessageResponse({
    required this.success,
    required this.conversation,
    required this.users
  });

  factory RoomMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomMessageResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'conversation')
  List<ConversationRoom> conversation;
  @JsonKey(name: 'users')
  List<UserDetails> users;
}
