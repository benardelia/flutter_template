import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../utils/helpers/logging_util.dart';
import '../utils/secure_storage/secure_storage.dart';

class LoginProvider with ChangeNotifier {
  final AuthService _authService = AuthService(); // Create an instance

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasError = false;

  bool get hasError => _hasError;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<void> authenticateUser(String phone, String password) async {
    await _handleAuth(() => _authService.authenticateUser(phone, password));
  }

  Future<void> refreshToken(String token) async {
    await _handleAuth(() => _authService.refreshToken(token));
  }

  Future<void> _handleAuth(
    Future<Map<String, dynamic>> Function() authFunction,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      Map<String, dynamic> result = await authFunction();

      if (result['access_token'] == null) {
        _setAuthError('invalid-credentials');
        return;
      }

      Log.i(result);

      SecureStorage secureStorage = SecureStorage();

      await Future.wait([
        secureStorage.saveAccessToken(result['access_token']),
        secureStorage.saveRefreshToken(result['refresh_token']),
        secureStorage.saveExpiresIn(result['expires_in']),
        // secureStorage.saveUniqueId(result.user?.uniqueId ?? ''),
        // if (result.user?.userType != null) ...{
        //   secureStorage.saveUserType(result.user!.userType!),
        // },
        // secureStorage.saveUsername(result.user?.username ?? ''),
        // secureStorage.saveFirstName(result.user?.firstName ?? ''),
        // secureStorage.saveCompanyName(result.user?.companyName ?? ''),
        // secureStorage.saveLastName(result.user?.lastName ?? ''),
        // secureStorage.saveProfilePhone(result.user?.profilePhone ?? ''),
        // secureStorage.savePermissions(result.user?.permissions),
        // secureStorage.saveUserHasLoggedIn(true),
      ]);

      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      // navigatorKey.currentState?.pushNamed(Routes.login);
      Log.i("In provider 3 $e");
      _setAuthError('invalid-credentials');
    }
  }

  void _setAuthError(String message) {
    _isLoading = false;
    _hasError = true;
    _errorMessage = message;
    notifyListeners();
  }

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  setPasswordObscure(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }
}
