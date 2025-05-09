import 'package:vilcom_digital_restaurant/graphql/query/constant_fields.dart';

const getVilcomPackages = '''
query getVilcomPackages(\$filtering:VilcomPackageFilteringInputObject){
  getVilcomPackages(filtering: \$filtering){
    response{
     $responseFields
    }
    data{
      $packageFields
    }
  }
}
''';

const getVilcomFoods = '''
    query getVilcomFoods(\$filtering: VilcomFoodFilteringInputObject){
  getVilcomFoods(filtering: \$filtering){
     response{
     $responseFields
    }
    data{
      id
      uuid
      foodName
      foodDescription
      foodPhoto
      foodPackage{
        id
        uuid
        packageName
        packageDescription
        isActive
        }
        foodSize
        foodQuantity
        foodPrice
        isActive
    }
  }
}
''';

const getVilcomLocations = '''
    query getVilcomLocations(\$filtering: VilcomLocationsFilteringInputObject!){
  getVilcomLocations(filtering: \$filtering){
     response{
      id
      status
      code
      message
    }
    data{
      id
			uuid
			locationName
			isActive
    }
  }
}
''';
