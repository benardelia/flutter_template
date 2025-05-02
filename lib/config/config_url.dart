import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/secure_storage/secure_storage.dart';
import 'env.constants.dart';

class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  final Duration timeoutDuration = Duration(seconds: 60); // Set your timeout

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(timeoutDuration);
  }
}

class GraphQLConfig {
  static Future<GraphQLClient> initializeClient() async {
    final prefs = await SharedPreferences.getInstance();
    var currentLang = prefs.getString('languageCode') ?? 'sw';

    HttpLink httpLink = HttpLink(
      gqlServerUrl,
      httpClient: TimeoutHttpClient(),
      defaultHeaders: {'Source': 'mobile', 'Lang': currentLang},
    );
    SecureStorage secureStorage = SecureStorage();
    final token = await secureStorage.getAccessToken();

    // Check if token is null before using it
    final AuthLink authLink = AuthLink(
      getToken: () async {
        // If token is null, don't include it in the request
        if (token == null) {
          return null; // No token
        }
        return 'Bearer $token'; // Return the token if valid
      },
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      queryRequestTimeout: Duration(seconds: 60),
      cache: GraphQLCache(),
    );
  }
}
