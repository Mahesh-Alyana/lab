import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/entity/message_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mark_message_read_response.g.dart';

@JsonSerializable()
class MarkMessageReadResponse{

  MarkMessageReadResponse({
    required this.success,
    required this.data,
  });

  factory MarkMessageReadResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkMessageReadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarkMessageReadResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'data')
  Map<String,dynamic> data;
}
