import 'package:vilcom_digital_restaurant/graphql/query/user_query.dart';
import 'package:vilcom_digital_restaurant/models/response_model/response_model.dart';
import 'package:vilcom_digital_restaurant/models/user_model/user_model.dart';
import 'package:vilcom_digital_restaurant/models/user_profile_role/user_profile_role.dart';
import 'package:vilcom_digital_restaurant/services/base_service.dart';
import 'package:vilcom_digital_restaurant/services/graphql/graphql_service.dart';
import 'package:vilcom_digital_restaurant/utils/helpers/logging_util.dart';

class UserProfileService extends BaseService {
  Future<UserProfileAndRoleData?> getUserProfile() async {
    return await execute(() async {
      final response = await GraphQLService.performQuery(getUserProfileAndRole);

      if (response.hasException) {
        throw Exception(response.exception?.graphqlErrors);
      }

      if (response.data == null) {
        throw Exception(
          'Failed to fetch translations: No data found in the response',
        );
      }

      var profileJson =
          response.data!['getUserProfileAndRole']['data']['userProfile'];
      var roleJson =
          response.data!['getUserProfileAndRole']['data']['userRoles'];
      var jsonResponse = response.data!['getUserProfileAndRole']['response'];
      return UserProfileAndRoleData(
        userProfile: UserProfile.fromJson(profileJson),
        userRoles:
            (roleJson as List<dynamic>?)
                ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
                .toList(),
        response: ResponseObjects.fromJson(jsonResponse),
      );
    });
  }

  Future<ResponseObjects?> createUsers({
    required String firstName,
    String? profileUniqueId,
    required String lastName,
    required String email,
    String? phone,
    String? title,
    String? photo,
    String? gender,
    String? profileType,
    String? profileLevel,
    String? roleUniqueId,
    required String password,
  }) async {
    return await execute(() async {
      final response = await GraphQLService.performMutation(
        createMyAccountMutation,
        variables: {
          "input": {
            "profileUniqueId": profileUniqueId,
            "userFirstName": firstName,
            "userLastName": lastName,
            "userEmail": email,
            // "profilePhone": phone ?? "",
            // "profileTitle": title ?? "",
            // "profilePhoto": photo ?? "",
            // "profileGender": gender ?? "MALE",
            // "profileType": profileType ?? "ADMIN_PROFILE",
            // "profileLevel": profileLevel ?? "REGION",
            // "roleUniqueId": roleUniqueId ,
            "password": password,
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

      var jsonResponse = response.data!['createMyAccountMutation']['response'];
      Log.i(jsonResponse);
      return ResponseObjects.fromJson(jsonResponse);
    });
  }

  Future<ResponseObjects?> updateUsers({
    required String firstName,
    required String profileUniqueId,
    String? lastName,
    String? email,
    String? phone,
    String? title,
    String? gender,
    String? profileType,
    String? profileLevel,
    String? roleUniqueId,
    String? password,
  }) async {
    return await execute(() async {
      final response = await GraphQLService.performMutation(
        updateMyProfileMutation,
        variables: {
          "input": {
            "profileUniqueId": profileUniqueId,
            "userFirstName": firstName,
            "userLastName": lastName,
            "userEmail": email,
            "profilePhone": phone,
            "profileTitle": title,
            "profileGender": gender,
            "profileType": profileType,
            "profileLevel": profileLevel,
            "roleUniqueId": roleUniqueId,
            "password": password,
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

      var jsonResponse = response.data!['updateMyProfileMutation']['response'];
      return ResponseObjects.fromJson(jsonResponse);
    });
  }

  Future<ResponseObjects?> forgotPassword({required String userEmail}) async {
    return await execute(() async {
      final response = await GraphQLService.performMutation(
        forgotPasswordMutation,
        variables: {"userEmail": userEmail},
      );

      if (response.hasException) {
        throw Exception(response.exception?.graphqlErrors);
      }

      if (response.data == null) {
        throw Exception(
          'Failed to fetch translations: No data found in the response',
        );
      }

      var jsonResponse = response.data!['forgotPasswordMutation']['response'];
      return ResponseObjects.fromJson(jsonResponse);
    });
  }

  Future<ResponseObjects?> changeUserPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await execute(() async {
      final response = await GraphQLService.performMutation(
        changeUserPasswordMutation,
        variables: {
          "input": {"oldPassword": oldPassword, "newPassword": newPassword},
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

      var jsonResponse =
          response.data!['changeUserPasswordMutation']['response'];
      Log.i(jsonResponse);
      return ResponseObjects.fromJson(jsonResponse);
    });
  }

  Future<ResponseObjects?> updateVilcomLocation({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await execute(() async {
      final response = await GraphQLService.performMutation(
        updateVilcomLocationMutation,
        variables: {
          "input": {"oldPassword": oldPassword, "newPassword": newPassword},
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

      var jsonResponse =
          response.data!['updateVilcomLocationMutation']['response'];
      return ResponseObjects.fromJson(jsonResponse);
    });
  }
}
