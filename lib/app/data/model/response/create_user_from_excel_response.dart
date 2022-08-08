import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_from_excel_response.g.dart';

@JsonSerializable()
class CreateUserFromExcelResponse{

  CreateUserFromExcelResponse({
    required this.success,
    required this.result,
  });

  factory CreateUserFromExcelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserFromExcelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserFromExcelResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'result')
  List<Map<String,dynamic>> result;
}
