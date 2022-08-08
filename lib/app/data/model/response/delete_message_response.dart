import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_message_response.g.dart';

@JsonSerializable()
class DeleteMessageResponse{

  DeleteMessageResponse({
    required this.success,
    required this.deletedMessagesCount,
  });

  factory DeleteMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteMessageResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'deletedMessagesCount')
  int deletedMessagesCount;
}
