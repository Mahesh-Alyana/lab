import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_by_recipients.g.dart';

@JsonSerializable()
class ReadByRecipients{

  ReadByRecipients({
    required this.readByUserId,
    required this.readAt,
    required this.readByUser,
  });

  factory ReadByRecipients.fromJson(Map<String, dynamic> json) =>
      _$ReadByRecipientsFromJson(json);

  Map<String, dynamic> toJson() => _$ReadByRecipientsToJson(this);

  @JsonKey(name: 'readByUserId')
  String readByUserId;
  @JsonKey(name: 'readAt')
  String readAt;
  @JsonKey(name: 'readByUser')
  List<UserDetails> readByUser;
}