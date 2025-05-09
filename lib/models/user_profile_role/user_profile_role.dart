import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vilcom_digital_restaurant/models/response_model/response_model.dart';
import 'package:vilcom_digital_restaurant/models/user_model/user_model.dart';

part 'user_profile_role.g.dart';
@JsonSerializable()
class UserProfileAndRoleData {
  final UserProfile? userProfile;
  final List<UserRole>? userRoles;
  final ResponseObjects? response;

  UserProfileAndRoleData({
    this.response,
    this.userProfile,
    this.userRoles,
  });

  factory UserProfileAndRoleData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileAndRoleDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileAndRoleDataToJson(this);
}
