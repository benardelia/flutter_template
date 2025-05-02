import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseObjects {
  final String id;
  final bool status;
  final int code;
  final String message;

  ResponseObjects(
      {required this.id,
      required this.status,
      required this.code,
      required this.message});

  factory ResponseObjects.fromJson(Map<String, dynamic> json) =>
      _$ResponseObjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseObjectsToJson(this);
}
