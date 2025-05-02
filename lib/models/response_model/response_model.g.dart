// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseObjects _$ResponseObjectsFromJson(Map<String, dynamic> json) =>
    ResponseObjects(
      id: json['id'] as String,
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseObjectsToJson(ResponseObjects instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
