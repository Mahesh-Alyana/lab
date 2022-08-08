import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_details_response.g.dart';

@JsonSerializable()
class GetUserDetailsResponse{

  GetUserDetailsResponse({
    required this.success,
    required this.user
  });

  factory GetUserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDetailsResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'user')
  UserDetails user;
}
