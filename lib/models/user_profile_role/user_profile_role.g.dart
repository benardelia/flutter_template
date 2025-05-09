// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileAndRoleData _$UserProfileAndRoleDataFromJson(
  Map<String, dynamic> json,
) => UserProfileAndRoleData(
  response:
      json['response'] == null
          ? null
          : ResponseObjects.fromJson(json['response'] as Map<String, dynamic>),
  userProfile:
      json['userProfile'] == null
          ? null
          : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
  userRoles:
      (json['userRoles'] as List<dynamic>?)
          ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserProfileAndRoleDataToJson(
  UserProfileAndRoleData instance,
) => <String, dynamic>{
  'userProfile': instance.userProfile,
  'userRoles': instance.userRoles,
  'response': instance.response,
};
