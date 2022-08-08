import 'package:dump/app/data/model/entity/read_by_recipients.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collage.g.dart';

@JsonSerializable()
class Collage{

  Collage({
    required this.id,
    required this.name,
    required this.createdAt
  });

  factory Collage.fromJson(Map<String, dynamic> json) =>
      _$CollageFromJson(json);

  Map<String, dynamic> toJson() => _$CollageToJson(this);

  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'createdAt')
  String createdAt;
}