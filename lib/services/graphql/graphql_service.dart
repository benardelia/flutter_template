import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vilcom_digital_restaurant/providers/login_provider.dart';
import 'package:vilcom_digital_restaurant/utils/helpers/graphql_response_handler.dart';
import 'package:vilcom_digital_restaurant/utils/secure_storage/secure_storage.dart';
import '../../config/config_url.dart';

class GraphQLService {
  static Future<QueryResult> _executeOperation(OperationType type, String operation,
      {Map<String, dynamic>? variables}) async {
    final options = type == OperationType.query
        ? QueryOptions(
            document: gql(operation),
            variables: variables ?? {},
            fetchPolicy: FetchPolicy.networkOnly,
            pollInterval: Duration(seconds: 60),
          )
        : MutationOptions(
            document: gql(operation),
            variables: variables ?? {},
          );

    try {
      // Normal GraphQL query/mutation performed here
      var client = await GraphQLConfig.initializeClient();
      var result = type == OperationType.query
          ? await client.query(options as QueryOptions)
          : await client.mutate(options as MutationOptions);
      
      if (result.hasException) {
        throw Exception('GraphQL ${type == OperationType.query ? "Query" : "Mutation"} Error: ${result.exception}');
      }
      
      var response = GraphQLResponseHandler.extractResponse(result);

      // Check if the response is unauthorized, refresh your token else return the result
      // NB: The response may vary for this case; response with id '0' and code 9000 is unauthorized
      if (response?.id == '0' && response?.code == 9000) {
        try {
          SecureStorage secureStorage = SecureStorage();
          final refreshToken = await secureStorage.getRefreshToken();
          
          // Refresh token
          await LoginProvider().refreshToken(refreshToken!);
          
          // Initialize GraphQL client with newly acquired token
          client = await GraphQLConfig.initializeClient();
          
          // Make another request and assign response to result
          result = type == OperationType.query
              ? await client.query(options as QueryOptions)
              : await client.mutate(options as MutationOptions);
          
          // If it fails again, throw an error
          if (result.hasException) {
            throw Exception('GraphQL ${type == OperationType.query ? "Query" : "Mutation"} Error: ${result.exception}');
          }
        } catch (e) {
          rethrow;
        }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<QueryResult> performQuery(String query, {Map<String, dynamic>? variables}) => 
      _executeOperation(OperationType.query, query, variables: variables);

  static Future<QueryResult> performMutation(String mutation, {Map<String, dynamic>? variables}) => 
      _executeOperation(OperationType.mutation, mutation, variables: variables);
}

enum OperationType { query, mutation }
