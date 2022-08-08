import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_create_response.g.dart';

@JsonSerializable()
class UsersCreateResponse{

  UsersCreateResponse({
    required this.success,
    required this.message,
  });

  factory UsersCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersCreateResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'message')
  String message;

}
