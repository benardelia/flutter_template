import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/env.constants.dart';
import '../../main.dart';
import '../../routes/routes.dart';
import '../base_service.dart';

class AuthService extends BaseService {
  /// Authenticates a user with a given username and password
  Future<Map<String, dynamic>> authenticateUser(
    String username,
    String password,
  ) async {
    return _authenticate({
      'grant_type': passWordgrantType,
      'username': username,
      'password': password,
    });
  }

  /// Refreshes the user's authentication token
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    var user = await _authenticate({
      'grant_type': refreshTokenGrantType,
      'refresh_token': refreshToken,
    });

    if (user['access_token'] == null) {
      navigatorKey.currentState?.pushNamed(Routes.login);
      return user;
    }

    return user;
  }

  /// Handles authentication & token refresh logic
  Future<Map<String, dynamic>> _authenticate(Map<String, String> body) async {
    return await execute(() async {
      final response = await _postRequest(body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData.containsKey('error')) {
          return {
            'error': responseData['error'],
            'error_description': responseData['error_description'],
          };
        } else if (responseData.containsKey('access_token')) {
          final user = responseData;
          return user as Map<String, dynamic>;
        } else {
          final user = responseData;
          return user as Map<String, dynamic>;
        }
      } else {
        throw Exception('Authentication failed: ${response.statusCode}');
      }
    });
  }

  /// Sends a POST request to the authentication server
  Future<http.Response> _postRequest(Map<String, String> body) async {
    const String url = authServerUrl;

    final prefs = await SharedPreferences.getInstance();
    var currentLang = prefs.getString('languageCode') ?? 'sw';
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Source': 'mobile',
      'Lang': currentLang,
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
    };

    return await http.post(Uri.parse(url), headers: headers, body: body);
  }
}
