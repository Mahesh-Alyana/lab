import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_room_response.g.dart';

@JsonSerializable()
class CreateRoomResponse{

  CreateRoomResponse({
    required this.success,
    required this.chatRoom,
  });

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'chatRoom')
  Map<String,dynamic> chatRoom;
}
