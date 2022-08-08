import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse{

  UpdateUserResponse({
    required this.success,
    required this.message,
    required this.user
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'user')
  UserDetails user;
}
