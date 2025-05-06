/* import 'dart:convert';

import 'package:fcrs/graphQL/authentication.gql.dart';
import 'package:fcrs/modal/company/company_modal.dart';
import 'package:fcrs/modal/occupation/occupation_modal.dart';
import 'package:fcrs/modal/register_complainant_company_user.dart';
import 'package:fcrs/modal/register_complainant_user.dart';
import 'package:fcrs/modal/response/response_modal/response_modal.dart';
import 'package:fcrs/service/base_service.dart';
import 'package:fcrs/service/graphql/graph_ql_service.dart';
import 'package:fcrs/utils/helpers/logging_util.dart';

class RegistrationService extends BaseService {
  // =================== Registration Service ===================
  static Future<RegisterComplainantUserMutation> userRegistrationService(
      {required String dateOfBirth,
      required String education,
      required String email,
      required String firstName,
      required String middleName,
      required String nationality,
      String? nin,
      String? passportNumber,
      String? passportExpDate,
      required String occupationUuid,
      required String phoneNumber,
      required String sex,
      required String surname}) async {
    var input = {
      "input": {
        "surname": surname,
        "sex": sex,
        "phoneNumber": phoneNumber,
        "occupationUuid": occupationUuid,
        "nin": nin,
        "passportExpDate": passportExpDate,
        "passportNumber": passportNumber,
        "nationality": nationality,
        "middleName": middleName,
        "firstName": firstName,
        "email": email,
        "education": education,
        "dateOfBirth": dateOfBirth
      }
    };

    var result = await GraphQLService.performMutation(
        registerComplainantUserMutation,
        variables: input);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    RegisterComplainantUserMutation registerComplainantUserMutationResult;
    try {
      // Extracting the JSON data from the QueryResult object
      final jsonData = json.encode(result.data);

      // Log.i(jsonData);

      // Parsing the JSON data to RegisterComplainantUserMutation object
      registerComplainantUserMutationResult =
          registerComplainantUserMutationFromJson(jsonData);
    } on Exception {
      throw Exception('Error parsing response');
    }

    return registerComplainantUserMutationResult;
  }

  static Future<RegisterComplainantCompanyRepresentativeMutation>
      companyRegistrationService(
    ComplainantCompany company, {
    required String gender,
    required String firstName,
    required String middleName,
    required String surname,
    String? nin,
    String? passportNum,
    String? passportEpireDate,
    required String dateOfBirth,
    required String education,
    required String email,
    required String nationality,
    required String occupationUid,
    required String phoneNumber,
    required String sex,
  }) async {
    var variables = {
      "input": {
        "uuid": null,
        "unsurvayedAddress": null,
        "taxPayerTin": company.taxPayerTin,
        "street": null,
        "shortForm": company.shortForm,
        "road": null,
        "regNumber": company.companyRegNumber,
        "mobPhone": company.mobPhone,
        "houseNumber": null,
        "email": null,
        "country": null,
        "companyName": company.companyName,
        "box": null,
        "representative": {
          "nin": nin,
          "firstName": firstName,
          "middleName": middleName,
          "surname": surname,
          "sex": sex,
          "nationality": nationality,
          "phoneNumber": phoneNumber,
          "passportNumber": passportNum,
          "passportExpDate": passportEpireDate,
          "photo": null,
          "dateOfBirth": dateOfBirth,
          "residentRegion": null,
          "residentDistrict": null,
          "residentWard": null,
          "email": email,
          "education": education,
          "occupationUuid": occupationUid,
          "uuid": null
        }
      }
    };

    var result = await GraphQLService.performMutation(registerCompanyMutation,
        variables: variables);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    RegisterComplainantCompanyRepresentativeMutation registerCompanyResponse;
    try {
      // Extracting the JSON data from the QueryResult object
      // var response = result.data!["registerCompanyMutation"]["response"];
      var response = json.encode(result.data);
      // Parsing the JSON data to RegisterComplainantUserMutation object
      registerCompanyResponse =
          registerComplainantCompanyRepresentativeMutationFromJson(response);
    } on Exception {
      throw Exception('Error parsing response');
    }

    return registerCompanyResponse;
  }

  // =================== get Occupations service ===================
  static Future<List<Occupation>?> getOccupations() async {
    var result = await GraphQLService.performQuery(
      getOccupationsQuery,
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    List<Occupation>? occupatiosList = [];

    try {
      List data = result.data!["getAllOccupations"]["data"];
      for (var value in data) {
        occupatiosList.add(Occupation.fromJson(value));
      }
    } on Exception {
      occupatiosList = null;
      throw Exception('Error parsing response');
    }

    return occupatiosList;
  }

  // =================== Request OTP service ===================

  static Future<ResponseObjects> requestOtp(
      String phoneNumber , String email, bool requestOtpAgain) async {
    var result = await GraphQLService.performQuery(
      verifyPhoneNumberMutationGql,
      variables: {
        "phoneNumber": phoneNumber,
        "email":email,
        'mobileRequest': !requestOtpAgain
      },
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    ResponseObjects response;
    try {
      // Parsing the JSON data to RegisterComplainantUserMutation object
      var data = result.data!["verifyPhoneNumberMutation"]["response"];
      // Log.i(data);
      response = ResponseObjects.fromJson(data);
    } on Exception {
      throw Exception('Error parsing response');
    }

    // when the response is parsed successfully, means the OTP was sent successfully
    return response;
  }

  // =================== Verify OTP service ===================

  static Future<ResponseObjects> verifyPhoneNumberWithOtp(
      String phoneNumber, String otp) async {
    var variables = {
      "input": {"otp": otp, "phoneNumber": phoneNumber}
    };

    var result = await GraphQLService.performQuery(
      verifyOtpMutation,
      variables: variables,
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    ResponseObjects response;
    try {
      // Parsing the JSON data to RegisterComplainantUserMutation object
      var data = result.data!["verifyOtpMutation"]["response"];
      response = ResponseObjects.fromJson(data);
    } on Exception {
      throw Exception('Error parsing response');
    }

    // when the response is parsed successfully, means the OTP was sent successfully
    return response;
  }

// =================== forgot password service ===================

  Future<ResponseObjects> forgotPassword(String email) async {
    var variables = {"userEmail": email};

    var result = await execute(() async {
      return await GraphQLService.performQuery(
        forgotPasswordMutation,
        variables: variables,
      );
    });

    Log.i(result);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    ResponseObjects response;
    try {
      // Parsing the JSON data to RegisterComplainantUserMutation object
      var data = result.data!["forgotPasswordMutation"]["response"];
      response = ResponseObjects.fromJson(data);
    } on Exception {
      throw Exception('Error parsing response');
    }

    // when the response is parsed successfully, means the OTP was sent successfully
    return response;
  }

// =================== create password service ===================

  static Future<ResponseObjects> createPassword(
      String requestToken, String phoneNumber, String userPassword) async {
    var variables = {
      "input": {
        "requestToken": requestToken,
        "phoneNumber": phoneNumber,
        "userPassword": userPassword
      }
    };

Log.i(variables);
    var result = await GraphQLService.performQuery(
      resetPasswordMutation,
      variables: variables,
    );

    Log.i(result);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    ResponseObjects response;
    try {
      // Parsing the JSON data to RegisterComplainantUserMutation object
      var data = result.data!["resetPasswordMutation"]["response"];
      print(data);
      print(data);
      response = ResponseObjects.fromJson(data);
    } on Exception {
      throw Exception('Error parsing response');
    }

    // when the response is parsed successfully, means the OTP was sent successfully
    return response;
  }

// =================== revoke token  ===================

  Future<ResponseObjects> revokeAccessToken(String token) async {
    var variables = {"token": token};

    var result = await execute(() async {
      return await GraphQLService.performQuery(
        revokeAccessTokenMutation,
        variables: variables,
      );
    });

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    ResponseObjects response;
    try {
      var data = result.data!["revokeAccessTokenMutation"]["response"];
      response = ResponseObjects.fromJson(data);
    } on Exception catch (_) {
      throw Exception('Error parsing response');
    }
    return response;
  }

//  =================== verify brella service =================================

  static Future<ComplainantCompany?> verifyBrela(String brelaNumber) async {
    try {
      var variables = {
        "input": {"regNumber": brelaNumber}
      };
      var result = await GraphQLService.performMutation(
          brelaVerificationMutation,
          variables: variables);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      ResponseObjects responseData = ResponseObjects.fromJson(
          result.data!['brelaVerificationMutation']['response']);
      ComplainantCompany? company;
      if (responseData.status) {
        company = ComplainantCompany.fromJson(
            result.data!['brelaVerificationMutation']['data']);
      }

      return company;
    } catch (e) {
      return null;
    }
  }
}
 */