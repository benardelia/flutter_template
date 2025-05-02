import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vilcom_digital_restaurant/models/response_model/response_model.dart';

class GraphQLResponseHandler {
  /// Extracts data from any GraphQL response
  static ResponseObjects? extractResponse(QueryResult result) {
    if (result.hasException) {
      return null;
    }

    final data = result.data;
    if (data == null) {
      return null;
    }

    // Find the first key dynamically (since mutation & query keys differ)
    final key = data.keys.elementAt(1);
    final responseData = data[key];
    if (responseData == null) {
      return null;
    }


    return ResponseObjects.fromJson(responseData['response']);
  }
}