import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_dropdown.dart';
import 'package:vilcom_digital_restaurant/providers/user_profile_provider.dart';
import 'package:vilcom_digital_restaurant/utils/helpers/logging_util.dart';

import '../../config/styles/input_decorator.dart';
import '../../custom_widgets/custom_huge_icon.dart';
import '../../custom_widgets/custom_text.dart';
import '../../routes/routes.dart';
import '../../services/toast_service/toast_service.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final gender = TextEditingController();

  @override
  void initState() {
    var user =
        context.read<UserProfileProvider>().userProfileAndRoleData?.userProfile;
    firstName.text = user?.userFirstName ?? '';
    lastName.text = user?.userLastName ?? '';
    email.text = user?.userEmail ?? '';
    phone.text = user?.profilePhone ?? '';
    gender.text = user?.profileGender ?? '';
    super.initState();
  }

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
                    CText(text: 'Update Profile', size: 23),

                    TextFormField(
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecorationX.decorator(
                        label: 'First Name',
                        icon: HugeIcons.strokeRoundedUser,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: lastName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecorationX.decorator(
                        label: 'Last Name',
                        icon: HugeIcons.strokeRoundedUser,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorationX.decorator(
                        label: 'email',
                        icon: HugeIcons.strokeRoundedMailAccount02,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecorationX.decorator(
                        label: 'Phone',
                        icon: HugeIcons.strokeRoundedSmartPhone01,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),

                    CDropDownButton(
                      label: 'Gender',
                      value: provider.selectedGender,
                      items: provider.genderOptions,
                      onChange: (String? newValue) {
                        provider.selectedGender = newValue;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your gender';
                        }
                        return null;
                      },
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await provider.updateUserProfile(
                            profileUniqueId:
                                provider
                                    .userProfileAndRoleData!
                                    .userProfile!
                                    .profileUniqueId!,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: email.text,
                            gender: provider.selectedGender!,
                            phone: phone.text,
                          );

                          if (provider.response?.status == true) {
                            // Navigate to the home screen
                            provider.getUserProfile();
                            ToastService.showSuccessToast(
                              context,
                              message:
                                  provider.response?.message ??
                                  'Profile Updated',
                            );
                            Navigator.pop(context);
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
                        'Update',
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
