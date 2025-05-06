/* import 'package:fcrs/graphQL/profile.gql.dart';
import 'package:fcrs/modal/profile_data/profile_data.dart';
import 'package:fcrs/modal/response/response_modal/response_modal.dart';
import 'package:fcrs/service/base_service.dart';
import 'package:fcrs/service/graphql/graph_ql_service.dart';
import 'package:fcrs/utils/helpers/logging_util.dart';

import '../../modal/company/company_modal.dart';
import '../../modal/response/base_response/base_response.dart';

class UserProfileService extends BaseService {
  static Future<ProfileData?>? getComplainantProfile() async {
    final result = await GraphQLService.performQuery(
      getComplainantProfileQuery,
    );

    // Log.i(result);
    // Log.w(result);
    if (result.hasException) {
      return null;
    }

    var response = result.data?['getComplainantProfile']['data'];

    return ProfileData.fromJson(response);
  }

  static Future<Map<String, dynamic>?> deleteProfileAccount(String uuid) async {
    print("from service: $uuid");
    var variable = {
      "uuid": uuid
    };
    final result = await GraphQLService.performMutation(deleteUser, variables: variable);

    if (result.hasException) {
      return null;
    }

    // Add null checks for the response structure
    if (result.data == null || result.data!['deactivateComplainantsProfileMutation'] == null || result.data!['deactivateComplainantsProfileMutation']['response'] == null) {
      return null;
    }

    return result.data!['deactivateComplainantsProfileMutation'];
  }

  static Future<ComplainantCompany?>? getCompanyProfile() async {
    final result = await GraphQLService.performQuery(
      getCompanyComplainantProfileQuery,
    );
    // Log.i(result);
    // Log.w(result);
    if (result.hasException) {
      return null;
    }

    var response = result.data?['getCompanyProfile']['data'];

    return ComplainantCompany.fromJson(response);
  }

  Future<CustomBaseResponse?> updateMyComplainantProfile({required String education, required String occupationUuid, required String district, required String region, required String ward, required String uuid}) async {
    var input = {
      "input": {
        "education": education,
        "occupationUuid": occupationUuid,
        "residentDistrict": district,
        "residentRegion": region,
        "residentWard": ward,
        "uuid": uuid,
      }
    };
    return await execute(() async {
      var result = await GraphQLService.performMutation(updateMyComplainantProfileMutation, variables: input);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      ProfileData complainantProfile;
      CustomBaseResponse customBaseResponse;
      try {
        // Extracting the JSON data from the QueryResult object
        complainantProfile = ProfileData.fromJson(result.data!['updateMyComplainantProfileMutation']['data']);

        ResponseObjects response = ResponseObjects.fromJson(result.data!['updateMyComplainantProfileMutation']['response']);

        customBaseResponse = CustomBaseResponse(response: response, data: complainantProfile);

        // Parsing the JSON data to RegisterComplainantUserMutation object
      } on Exception catch (_) {
        throw Exception('Error parsing response');
      }

      return customBaseResponse;
    });
  }

// =================== create password service ===================

  static Future<ResponseObjects> changePassword(String oldPassword, String newPassword) async {
    var variables = {
      "input": {
        "newPassword": newPassword,
        "oldPassword": oldPassword
      }
    };

    var result = await GraphQLService.performMutation(
      changePasswordMutation,
      variables: variables,
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    Log.i(result);

    ResponseObjects response;
    try {
      // Parsing the JSON data to RegisterComplainantUserMutation object
      var data = result.data!["changePasswordMutation"]["response"];
      response = ResponseObjects.fromJson(data);
    } on Exception catch (e) {
      Log.e(e.toString());
      throw Exception('Error parsing response');
    }

    // when the response is parsed successfully, means the OTP was sent successfully
    return response;
  }
}
 */