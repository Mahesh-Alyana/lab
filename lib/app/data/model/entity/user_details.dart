import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails{

  UserDetails({
    required this.id,
    required this.email,
  required this.password,
  required this.firstName,
  required this.lastName,
  required this.college,
  required this.mobile,
  required this.type,
  required this.createdAt,
  required this.v
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'college')
  String college;
  @JsonKey(name: 'mobile')
  String mobile;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'createdAt')
  String createdAt;
  @JsonKey(name: '__v')
  int v;
}