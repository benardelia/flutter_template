import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import 'package:vilcom_digital_restaurant/providers/user_profile_provider.dart';
import '../../providers/login_provider.dart';
import '../../providers/registration_provider.dart';
import '../interceptor/app_lifecycle_state.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => RegistrationProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => UserProfileProvider()),
  ];
}

void registerControllers() {
  Get.put(AppLifecycleController(), permanent: true);
}
