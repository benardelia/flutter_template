import 'package:flutter/material.dart';

import '../views/authentication/change_password.dart';
import '../views/authentication/forgot_password.dart';
import '../views/authentication/login.dart';
import '../views/authentication/otp_verification.dart';
import '../views/authentication/register.dart';
import '../views/help_center/help_center.dart';
import '../views/home/homepage.dart';
import '../views/home/navigation.dart';
import '../views/intro_pages/on_boarding_screen.dart';
import '../views/intro_pages/terms_and_policy.dart';
import '../views/profile/profile.dart' show Profile;
import '../views/profile/update_profile.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.forgetPass:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case Routes.register:
        return MaterialPageRoute(builder: (_) => const Register());
      // with argument pass this
      // case Routes.helpSlugCenter:
      //   final args = settings.arguments as HelpObject;
      //   return MaterialPageRoute(
      //     builder: (_) => HelpSlugPage(
      //       helpObject: args,
      //     ),
      //   );
      case Routes.otpVerification:
        return MaterialPageRoute(builder: (_) => const OtpVerification());
      case Routes.termsPolicy:
        return MaterialPageRoute(builder: (_) => TermsAndPolicy());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case Routes.helpCenter:
        return MaterialPageRoute(builder: (_) => const HelpCenter());
      case Routes.profileUpdate:
        return MaterialPageRoute(builder: (_) => const UpdateProfile());
      case Routes.navigation:
        return MaterialPageRoute(builder: (_) => const Navigation());
      // case Routes.textBook:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (_) => TextBookReader(
      //           paragraphs: args['paragraphs'],
      //           title: args['title'],
      //           author: args['author'],
      //           duration: args['duration']));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('Page not found')),
        );
      },
    );
  }
}
