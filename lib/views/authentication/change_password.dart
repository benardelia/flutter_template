import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/styles/input_decorator.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/providers/user_profile_provider.dart';
import 'package:vilcom_digital_restaurant/routes/routes.dart';
import 'package:vilcom_digital_restaurant/services/toast_service/toast_service.dart';
import 'package:vilcom_digital_restaurant/utils/helpers/logging_util.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Consumer<UserProfileProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: context.screenHeight * 0.02,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.screenHeight * 0.02),

                    CText(text: 'Change Password', size: 23),

                    TextFormField(
                      controller: oldPasswordController,
                      obscureText: provider.hidePassword,
                      decoration: InputDecorationX.decorator(
                        label: 'Old Password',
                        icon: HugeIcons.strokeRoundedLockPassword,
                        suffixIcon: TextButton(
                          child: CHugeIcon(
                            icon:
                                provider.hidePassword
                                    ? Icons.remove_red_eye_outlined
                                    : HugeIcons.strokeRoundedViewOff,
                          ),
                          onPressed: () {
                            provider.hidePassword = !provider.hidePassword;
                            Log.e(provider.hidePassword);
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: passwordController,
                      obscureText: provider.hidePassword,
                      decoration: InputDecorationX.decorator(
                        label: 'Password',
                        icon: HugeIcons.strokeRoundedLockPassword,
                        suffixIcon: TextButton(
                          child: CHugeIcon(
                            icon:
                                provider.hidePassword
                                    ? Icons.remove_red_eye_outlined
                                    : HugeIcons.strokeRoundedViewOff,
                          ),
                          onPressed: () {
                            provider.hidePassword = !provider.hidePassword;
                            Log.e(provider.hidePassword);
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: provider.hidePassword,
                      decoration: InputDecorationX.decorator(
                        label: 'Confirm Password',
                        icon: HugeIcons.strokeRoundedLockPassword,
                        suffixIcon: TextButton(
                          child: CHugeIcon(
                            icon:
                                provider.hidePassword
                                    ? Icons.remove_red_eye_outlined
                                    : HugeIcons.strokeRoundedViewOff,
                          ),
                          onPressed: () {
                            provider.hidePassword = !provider.hidePassword;
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password again';
                        }

                        if (value != passwordController.text) {
                          return 'Please enter the same password again';
                        }

                        return null;
                      },
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await provider.changePassword(
                            oldPassword: oldPasswordController.text,
                            newPassword: passwordController.text,
                          );

                          if (provider.response?.status == true) {
                            // Navigate to the home screen
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pushNamedAndRemoveUntil(
                              Routes.login, // The route to push
                              (Route<dynamic> route) =>
                                  false, // Predicate to determine which routes to remove
                            );

                            ToastService.showSuccessToast(
                              context,
                              message:
                                  provider.response?.message ??
                                  'Account created Successful',
                            );
                          } else {
                            // Show error message
                            ToastService.showErrorToast(
                              context,
                              message:
                                  provider.response?.message ??
                                  'Fail to register Your Account',
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        fixedSize: Size.fromWidth(context.screenWidth),
                        backgroundColor: context.primary,
                      ),
                      child: const Text(
                        'Change Password',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
