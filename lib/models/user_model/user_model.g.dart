// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  id: json['id'] as String?,
  profileUniqueId: json['profileUniqueId'] as String?,
  userFirstName: json['userFirstName'] as String?,
  userLastName: json['userLastName'] as String?,
  userEmail: json['userEmail'] as String?,
  profilePhone: json['profilePhone'] as String?,
  profileTitle: json['profileTitle'] as String?,
  profilePhoto: json['profilePhoto'] as String?,
  profileIsActive: json['profileIsActive'] as bool?,
  profileType: json['profileType'] as String?,
  profileLevel: json['profileLevel'] as String?,
  profileGender: json['profileGender'] as String?,
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profileUniqueId': instance.profileUniqueId,
      'userFirstName': instance.userFirstName,
      'userLastName': instance.userLastName,
      'userEmail': instance.userEmail,
      'profilePhone': instance.profilePhone,
      'profileTitle': instance.profileTitle,
      'profilePhoto': instance.profilePhoto,
      'profileIsActive': instance.profileIsActive,
      'profileType': instance.profileType,
      'profileLevel': instance.profileLevel,
      'profileGender': instance.profileGender,
    };

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole(
  id: json['id'] as String?,
  roleUniqueId: json['roleUniqueId'] as String?,
  roleName: json['roleName'] as String?,
  roleDescription: json['roleDescription'] as String?,
  rolePermissions:
      (json['rolePermissions'] as List<dynamic>?)
          ?.map((e) => RolePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
  'id': instance.id,
  'roleUniqueId': instance.roleUniqueId,
  'roleName': instance.roleName,
  'roleDescription': instance.roleDescription,
  'rolePermissions': instance.rolePermissions,
};

RolePermission _$RolePermissionFromJson(Map<String, dynamic> json) =>
    RolePermission(
      id: json['id'] as String?,
      permissionUniqueId: json['permissionUniqueId'] as String?,
      permissionName: json['permissionName'] as String?,
      permissionCode: json['permissionCode'] as String?,
    );

Map<String, dynamic> _$RolePermissionToJson(RolePermission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'permissionUniqueId': instance.permissionUniqueId,
      'permissionName': instance.permissionName,
      'permissionCode': instance.permissionCode,
    };
