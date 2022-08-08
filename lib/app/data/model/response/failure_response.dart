import 'package:json_annotation/json_annotation.dart';

part 'failure_response.g.dart';

@JsonSerializable()
class FailureResponse{

  FailureResponse({
    required this.success,
    required this.message,
  });

  factory FailureResponse.fromJson(Map<String, dynamic> json) =>
      _$FailureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FailureResponseToJson(this);

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'message')
  String message;
}
