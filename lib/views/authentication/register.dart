import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';

import '../../config/styles/input_decorator.dart';
import '../../custom_widgets/custom_text.dart';
import '../../providers/login_provider.dart';
import '../../routes/routes.dart';
import '../../services/toast_service/toast_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    usernameController.text = 'vilcom.digital@gmail.com';
    passwordController.text = 'vilcom@12345';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LoginProvider>(
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
                    SizedBox(height: context.screenHeight * 0.1),
                    Center(
                      child: CText(
                        text: 'vilcom digital restaurant',
                        fontWeight: FontWeight.bold,
                        size: 23,
                        // style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),

                    CText(text: 'Register', size: 23),

                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecorationX.decorator(
                        label: 'Username',
                        icon: HugeIcons.strokeRoundedUser,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecorationX.decorator(
                        label: 'email',
                        icon: HugeIcons.strokeRoundedMailAccount02,
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
                      decoration: InputDecorationX.decorator(
                        label: 'Phone Number',
                        icon: HugeIcons.strokeRoundedSmartPhone04,
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
                      decoration: InputDecorationX.decorator(
                        label: 'Password',
                        icon: HugeIcons.strokeRoundedLockPassword,
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
                      decoration: InputDecorationX.decorator(
                        label: 'Confirm Password',
                        icon: HugeIcons.strokeRoundedLockPassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await provider.authenticateUser(
                            usernameController.text,
                            passwordController.text,
                          );

                          if (!provider.isLoading && !provider.hasError) {
                            // Navigate to the home screen
                            Navigator.pushNamed(context, Routes.home);
                          } else {
                            // Show error message
                            ToastService.showErrorToast(
                              context,
                              message: 'Invalid credentials',
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
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Sign In'),
                        ),
                      ],
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
