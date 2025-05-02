import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import '../../providers/login_provider.dart';
import '../../providers/registration_provider.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => RegistrationProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
  ];
}
