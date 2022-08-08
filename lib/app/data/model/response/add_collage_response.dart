import 'package:dump/app/data/model/entity/collage.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_collage_response.g.dart';

@JsonSerializable()
class AddCollageResponse{

  AddCollageResponse({
    required this.success,
    required this.collage,
    required this.message
  });

  factory AddCollageResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCollageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddCollageResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'result')
  dynamic collage;
  @JsonKey(name: 'message')
  String message;
}
