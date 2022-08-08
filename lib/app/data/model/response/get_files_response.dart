import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_files_response.g.dart';

@JsonSerializable()
class GetFilesResponse{

  GetFilesResponse({
    required this.message,
    required this.files,
  });

  factory GetFilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFilesResponseToJson(this);

  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'files')
  List<Map<String,dynamic>> files;
}
