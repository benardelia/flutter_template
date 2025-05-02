import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  // Keys
  static const String _themeKey = 'app_theme_mode';
  static const String _onboardingCompletedKey = 'onboardingCompleted';
  static const String _keySelectedLocale = 'selected_locale';
  static const String _useTokenKey = 'user_token';
  static const String _userHasLoggedInKey = 'user_has_logged_in';
  static const String _userHasOpenNote = 'user_has_open_note';
  static const String _registrationStepKey = 'registration_step';
  static const String _userPhoneKey = 'user_phone';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresInKey = 'expires_in';
  static const String _uniqueIdKey = 'unique_id';
  static const String _userTypeKey = 'userType';
  static const String _usernameKey = 'username';
  static const String _companyNameKey = 'companyName';
  static const String _firstNameKey = 'firstName';
  static const String _lastNameKey = 'lastName';
  static const String _profilePhoneKey = 'profile_phone';
  static const String _permissionsKey = 'permissions';
  static const _keyProfile = "profile_data";
  static const _keyCompanyProfile = "company_profile_data";

  /// ********************************************
  /// ************* SAVED THEME ******************
  /// ************** PREFERENCE ******************
  // Save theme
  Future<void> saveTheme(int theme) async {
    await _storage.write(key: _themeKey, value: theme.toString());
  }

  // Get theme
  Future<int> getTheme() async {
    String? step = await _storage.read(key: _themeKey);
    return step != null ? int.tryParse(step) ?? 1 : 1;
  }

  /// ********************************************
  /// ************* SAVED LOCALE *****************
  /// ************** PREFERENCE ******************
  // Save selected locale
  Future<void> saveSelectedLocale(Locale locale) async {
    final Map<String, String> localeMap = {
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode ?? '',
    };
    final String localeJson = jsonEncode(localeMap); // Serialize to JSON
    await _storage.write(key: _keySelectedLocale, value: localeJson);
  }

  // Retrieve selected locale
  Future<Locale> getSelectedLocale() async {
    final String? localeJson = await _storage.read(key: _keySelectedLocale);
    if (localeJson != null) {
      final Map<String, dynamic> localeMap =
          jsonDecode(localeJson); // Deserialize JSON
      final String languageCode = localeMap['languageCode'] ?? '';
      final String countryCode = localeMap['countryCode'] ?? '';
      return Locale(languageCode, countryCode);
    } else {
      return const Locale('sw', 'TZ');
    }
  }

  Future<void> saveOnboardingCompleted(bool value) async {
    await _storage.write(key: _onboardingCompletedKey, value: value.toString());
  }

  Future<bool> getOnboardingCompleted() async {
    String? value = await _storage.read(key: _onboardingCompletedKey);
    return value != null ? value.toLowerCase() == 'true' : false;
  }

  // Save use token
  Future<void> saveUseToken(bool value) async {
    await _storage.write(key: _useTokenKey, value: value.toString());
  }

  // Get use token
  Future<bool> getUseToken() async {
    String? value = await _storage.read(key: _useTokenKey);
    return value != null ? value.toLowerCase() == 'true' : false;
  }

  // Save user has logged in
  Future<void> saveUserHasLoggedIn(bool value) async {
    await _storage.write(key: _userHasLoggedInKey, value: value.toString());
  }

  // Get user has logged in
  Future<bool> getUserHasLoggedIn() async {
    String? value = await _storage.read(key: _userHasLoggedInKey);
    return value != null ? value.toLowerCase() == 'true' : false;
  }

  // Save user already opened the app
  Future<void> saveUserHasOpenNote(bool value) async {
    await _storage.write(key: _userHasOpenNote, value: value.toString());
  }

  // Get user has logged in
  Future<bool> getUserHasOpenNote() async {
    String? value = await _storage.read(key: _userHasOpenNote);
    return value != null ? value.toLowerCase() == 'true' : false;
  }

  // Save registration step
  Future<void> saveRegistrationStep(int step) async {
    await _storage.write(key: _registrationStepKey, value: step.toString());
  }

  // Get registration step
  Future<int?> getRegistrationStep() async {
    String? step = await _storage.read(key: _registrationStepKey);
    return step != null ? int.tryParse(step) : 0;
  }

  // Save user phone
  Future<void> saveUserPhone(String phone) async {
    await _storage.write(key: _userPhoneKey, value: phone);
  }

  // Get user phone
  Future<String?> getUserPhone() async {
    return await _storage.read(key: _userPhoneKey);
  }

  // Save access token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Get access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Save expires in
  Future<void> saveExpiresIn(int expiresIn) async {
    final DateTime now = DateTime.now();
    final DateTime expireTime = now.add(Duration(seconds: expiresIn));
    await _storage.write(key: _expiresInKey, value: expireTime.toString());
  }

  // Get expires in
  Future<DateTime> getExpiresIn() async {
    String? expiresIn = await _storage.read(key: _expiresInKey);
    return expiresIn != null
        ? DateTime.tryParse(expiresIn) ?? DateTime.now()
        : DateTime.now();
  }

  // Save unique id
  Future<void> saveUniqueId(String uniqueId) async {
    await _storage.write(key: _uniqueIdKey, value: uniqueId);
  }

  // Get unique id
  Future<String?> getUniqueId() async {
    return await _storage.read(key: _uniqueIdKey);
  }

  // Save account type
  Future<void> saveUserType(String userType) async {
    await _storage.write(key: _userTypeKey, value: userType);
  }

  // Get account type
  Future<String?> getUserType() async {
    return await _storage.read(key: _userTypeKey);
  }

  // Save username
  Future<void> saveUsername(String username) async {
    await _storage.write(key: _usernameKey, value: username);
  }

  // Get username
  Future<String?> getUsername() async {
    return await _storage.read(key: _usernameKey);
  }

  // Save username
  Future<void> saveCompanyName(String companyName) async {
    await _storage.write(key: _companyNameKey, value: companyName);
  }

  // Get companyName
  Future<String?> getCompanyName() async {
    return await _storage.read(key: _companyNameKey);
  }

  // Save firstName
  Future<void> saveFirstName(String firstName) async {
    await _storage.write(key: _firstNameKey, value: firstName);
  }

  // Get firstName
  Future<String?> getFirstName() async {
    return await _storage.read(key: _firstNameKey);
  }

  // Save lastName
  Future<void> saveLastName(String lastName) async {
    await _storage.write(key: _lastNameKey, value: lastName);
  }

  // Get lastName
  Future<String?> getLastName() async {
    return await _storage.read(key: _lastNameKey);
  }

  // Save profile phone
  Future<void> saveProfilePhone(String profilePhone) async {
    await _storage.write(key: _profilePhoneKey, value: profilePhone);
  }

  // Get profile phone
  Future<String?> getProfilePhone() async {
    return await _storage.read(key: _profilePhoneKey);
  } // Save institution user id

// Save permissions (store list as JSON string)
  Future<void> savePermissions(List<dynamic>? permissions) async {
    if (permissions != null) {
      String encodedPermissions =
          jsonEncode(permissions); // Convert list to JSON
      await _storage.write(key: _permissionsKey, value: encodedPermissions);
    }
  }

// Get permissions (retrieve and decode JSON string into a list)
  Future<List<String?>?> getPermissions() async {
    String? encodedPermissions = await _storage.read(key: _permissionsKey);
    List<dynamic> decodedList =
        jsonDecode(encodedPermissions!); // Decode JSON string
    return decodedList.cast<String?>(); // Cast to List<String?>
  }


  /// Delete ProfileData from Secure Storage
  Future<void> deleteProfile() async {
    await _storage.delete(key: _keyProfile);
    await _storage.delete(key: _keyCompanyProfile);
  }

  // Logout
  Future<void> logout() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
