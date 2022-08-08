import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse{

  CreateUserResponse({
    required this.success,
    required this.user,
    required this.message
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'user')
  UserDetails user;
  @JsonKey(name: 'message')
  String message;
}
