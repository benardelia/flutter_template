import 'package:vilcom_digital_restaurant/graphql/query/constant_fields.dart';

const getUserProfileAndRole = '''
query getUserProfileAndRole{
  getUserProfileAndRole{
    response{
     $responseFields
    }
    data{
      id
      userProfile{
        $userProfileFields
      }
      userRoles{
        id
      	roleUniqueId
        roleName
        roleDescription
        rolePermissions{
            id
      	    permissionUniqueId
            permissionName
            permissionCode
        }
      }
    }
  }
}
''';

// *******************************  MUTATIONS  ********************************

const createUsersMutation = '''
mutation createUsersMutation(\$input : UserInputObject!){
  createUsersMutation(input: \$input){
    response{
      $responseFields
    }
    data{
      id
      userProfile{
        profileUniqueId
      }
    }
  }
}
''';

const updateUsersMutation = '''
mutation updateUsersMutation(\$input : UserInputObject!){
  updateUsersMutation(input: \$input){
    response{
       $responseFields
    }
    
     data{
      id
      userProfile{
        profileUniqueId
      }
    }
  }
}
''';

const forgotPasswordMutation = '''
  mutation forgotPasswordMutation(\$userEmail: String!){
  forgotPasswordMutation(userEmail: \$userEmail){
    response{
      $responseFields
    }
  }
}
''';

const changeUserPasswordMutation = '''
    mutation changeUserPasswordMutation(\$input: ForgortPasswordFilteringInputObject!){
  changeUserPasswordMutation(input: \$input){
    response{
      $responseFields
    }
  }
}
''';

const updateVilcomLocationMutation = '''
    mutation updateVilcomLocationMutation(\$input: VilcomLocationInputObject){
  updateVilcomLocationMutation(input: \$input){
    response{
      $responseFields
    }
    
    data{
      $locationFields
    }
  }
}
''';

const createMyAccountMutation = '''
    mutation CreateMyAccountMutation(\$input : UserAcountInputObject!){
      createMyAccountMutation(input: \$input){
        response{
          $responseFields
        }
      }
    }
''';

const updateMyProfileMutation = '''
    mutation UpdateMyProfileMutation(\$input: UserInputObject!) {
  updateMyProfileMutation(input: \$input) {
    response {
      $responseFields
    }
    data {
    $userProfileFields
      
    }
  }
}
 
''';
