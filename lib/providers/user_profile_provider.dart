import 'package:flutter/material.dart';
import 'package:vilcom_digital_restaurant/models/response_model/response_model.dart';
import 'package:vilcom_digital_restaurant/models/user_profile_role/user_profile_role.dart';
import 'package:vilcom_digital_restaurant/services/graphql_service/user_profile_service.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileService userProfileService = UserProfileService();

  String? _message;
  String? get message => _message;
  set message(String? message) {
    _message = message;
    notifyListeners();
  }

  bool _error = false;
  bool get error => _error;
  set error(bool error) {
    _error = error;
    notifyListeners();
  }

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set hidePassword(bool hidePassword) {
    _hidePassword = hidePassword;
    notifyListeners();
  }

  ResponseObjects? _response;
  ResponseObjects? get response => _response;
  set response(ResponseObjects? val) {
    _response = val;
    notifyListeners();
  }

  final List<String> genderOptions = ['MALE', 'FEMALE', 'OTHER'];
  String? _selectedGender;
  String? get selectedGender => _selectedGender;
  set selectedGender(String? selectedGender) {
    _selectedGender = selectedGender;
    notifyListeners();
  }

  UserProfileAndRoleData? _userProfileAndRoleData;
  UserProfileAndRoleData? get userProfileAndRoleData => _userProfileAndRoleData;
  set userProfileAndRoleData(UserProfileAndRoleData? userProfileAndRoleData) {
    _userProfileAndRoleData = userProfileAndRoleData;
    notifyListeners();
  }

  getUserProfile() async {
    await userProfileService
        .getUserProfile()
        .then((value) {
          if (value != null) {
            _userProfileAndRoleData = value;
          } else {
            _error = true;
          }
        })
        .whenComplete(() {
          notifyListeners();
        });
  }

  createUserProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await userProfileService
        .createUsers(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        )
        .then((value) {
          if (value != null) {
            _response = value;
          } else {
            _error = true;
          }
        })
        .whenComplete(() {
          notifyListeners();
        });
  }

  updateUserProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String gender,
    required String phone,
    required String profileUniqueId,
  }) async {
    await userProfileService
        .updateUsers(
          profileUniqueId: profileUniqueId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          gender: gender,
          phone: phone,
        )
        .then((value) {
          if (value != null) {
            _response = value;
          } else {
            _error = true;
          }
        })
        .whenComplete(() {
          notifyListeners();
        });
  }

  changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await userProfileService
        .changeUserPassword(oldPassword: oldPassword, newPassword: newPassword)
        .then((value) {
          if (value != null) {
            _response = value;
          } else {
            _error = true;
          }
        })
        .whenComplete(() {
          notifyListeners();
        });
  }
}
