import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{

  LoginResponse({
    required this.success,
    required this.authorization,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'authorization')
  String authorization;
  @JsonKey(name: 'user')
  UserDetails user;
}
