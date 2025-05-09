import 'package:vilcom_digital_restaurant/graphql/query/vilcom_food_package_query.dart';
import 'package:vilcom_digital_restaurant/services/graphql/graphql_service.dart';

class FoodPackageServices {
  Future<Map<String, dynamic>?> updateVilcomLocation({
    String? packageName,
    String? packageDescription,
    String? uuid,
  }) async {
    final response = await GraphQLService.performQuery(
      getVilcomPackages,
      variables: {
        "filtering": {
          "uuid": uuid,
          "packageName": packageName,
          "packageDescription": packageDescription,
        },
      },
    );

    if (response.hasException) {
      throw Exception(response.exception?.graphqlErrors);
    }

    if (response.data == null) {
      throw Exception(
        'Failed to fetch translations: No data found in the response',
      );
    }

    var jsonResponse = response.data!['getVilcomPackages']['data'];
    return jsonResponse as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getAllVilcomPackage({
    String? uuid,
    String? packageName,
    String? packageDescription,
  }) async {
    final response = await GraphQLService.performQuery(
      getVilcomPackages,
      variables: {
        "filtering": {
          "uuid": uuid,
          "packageName": packageName,
          "packageDescription": packageDescription,
        },
      },
    );

    if (response.hasException) {
      throw Exception(response.exception?.graphqlErrors);
    }

    if (response.data == null) {
      throw Exception(
        'Failed to fetch translations: No data found in the response',
      );
    }

    var jsonResponse = response.data!['getVilcomPackages']['data'];
    return jsonResponse as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getAllVilcomFoods({
    String? uuid,
    String? foodName,
    String? packageUuid,
  }) async {
    final response = await GraphQLService.performQuery(
      getVilcomFoods,
      variables: {
        "filtering": {
          "uuid": uuid,
          "foodName": foodName,
          "packageUuid": packageUuid,
        },
      },
    );

    if (response.hasException) {
      throw Exception(response.exception?.graphqlErrors);
    }

    if (response.data == null) {
      throw Exception(
        'Failed to fetch translations: No data found in the response',
      );
    }

    var jsonResponse = response.data!['getVilcomFoods']['data'];
    return jsonResponse as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getAllVilcomLocations({
    String? uuid,
    String? locationName,
  }) async {
    final response = await GraphQLService.performQuery(
      getVilcomLocations,
      variables: {
        "filtering": {"uuid": uuid, "locationName": locationName},
      },
    );

    if (response.hasException) {
      throw Exception(response.exception?.graphqlErrors);
    }

    if (response.data == null) {
      throw Exception(
        'Failed to fetch translations: No data found in the response',
      );
    }

    var jsonResponse = response.data!['getVilcomFoods']['data'];
    return jsonResponse as Map<String, dynamic>;
  }
}
