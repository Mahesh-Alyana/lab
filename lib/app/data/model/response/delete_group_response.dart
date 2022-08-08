import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_group_response.g.dart';

@JsonSerializable()
class DeleteGroupResponse{

  DeleteGroupResponse({
    required this.success,
    required this.message,
    required this.deletedMessagesCount,
    required this.deletedRoomsCount
  });

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteGroupResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'deletedRoomsCount')
  int deletedRoomsCount;
  @JsonKey(name: 'deletedMessagesCount')
  int deletedMessagesCount;
}
