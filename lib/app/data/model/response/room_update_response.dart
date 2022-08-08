import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_update_response.g.dart';

@JsonSerializable()
class RoomUpdateResponse{

  RoomUpdateResponse({
    required this.success,
  });

  factory RoomUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomUpdateResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
}
