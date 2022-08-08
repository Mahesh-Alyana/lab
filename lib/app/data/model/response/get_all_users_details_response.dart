import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_users_details_response.g.dart';

@JsonSerializable()
class GetAllUserDetailsResponse{

  GetAllUserDetailsResponse({
    required this.success,
    required this.users
  });

  factory GetAllUserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUserDetailsResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'users')
  List<UserDetails> users;
}
