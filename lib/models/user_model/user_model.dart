import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserProfile {
  final String? id;
  final String? profileUniqueId;
  final String? userFirstName;
  final String? userLastName;
  final String? userEmail;
  final String? profilePhone;
  final String? profileTitle;
  final String? profilePhoto;
  final bool? profileIsActive;
  final String? profileType;
  final String? profileLevel;
  final String? profileGender;

  UserProfile({
    this.id,
    this.profileUniqueId,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.profilePhone,
    this.profileTitle,
    this.profilePhoto,
    this.profileIsActive,
    this.profileType,
    this.profileLevel,
    this.profileGender,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class UserRole {
  final String? id;
  final String? roleUniqueId;
  final String? roleName;
  final String? roleDescription;
  final List<RolePermission>? rolePermissions;

  UserRole({
    this.id,
    this.roleUniqueId,
    this.roleName,
    this.roleDescription,
    this.rolePermissions,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}

@JsonSerializable()
class RolePermission {
  final String? id;
  final String? permissionUniqueId;
  final String? permissionName;
  final String? permissionCode;

  RolePermission({
    this.id,
    this.permissionUniqueId,
    this.permissionName,
    this.permissionCode,
  });

  factory RolePermission.fromJson(Map<String, dynamic> json) =>
      _$RolePermissionFromJson(json);
  Map<String, dynamic> toJson() => _$RolePermissionToJson(this);
}
