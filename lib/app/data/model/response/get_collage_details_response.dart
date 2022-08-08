import 'package:dump/app/data/model/entity/collage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_collage_details_response.g.dart';

@JsonSerializable()
class GetCollageResponse{

  GetCollageResponse({
    required this.success,
    required this.collages,
  });

  factory GetCollageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCollageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollageResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'collages')
  List<Collage> collages;
}
