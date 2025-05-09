import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_expansion_tile.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_outlined.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custome_alert_dialog.dart';
import 'package:vilcom_digital_restaurant/providers/user_profile_provider.dart';
import 'package:vilcom_digital_restaurant/routes/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProfileProvider>().getUserProfile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserProfileProvider>(
        builder: (context, provider, child) {
          if (provider.userProfileAndRoleData == null) {
            return Center(child: CText(text: 'No data found'));
          }
          var user = provider.userProfileAndRoleData!.userProfile!;
          // Log.i(user!.toJson());
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: CHugeIcon(
                      icon: HugeIcons.strokeRoundedUser03,
                      size: 80,
                    ),
                  ),

                  CText(text: user.userEmail!),

                  buildMoreActions(
                    [
                      ExpansionData(
                        label: user.userFirstName ?? '',
                        icon: HugeIcons.strokeRoundedUser,
                        filled: false,
                      ),
                      ExpansionData(
                        label: user.userLastName ?? '',
                        icon: HugeIcons.strokeRoundedMale02,
                        filled: false,
                      ),

                      ExpansionData(
                        label: user.userEmail ?? '',
                        icon: HugeIcons.strokeRoundedMail02,
                        filled: false,
                      ),

                      ExpansionData(
                        label: user.profileGender ?? '',
                        icon: HugeIcons.strokeRoundedFemale02,
                        filled: false,
                      ),

                      ExpansionData(
                        label: user.profilePhone ?? '',
                        icon: HugeIcons.strokeRoundedSmartPhone01,
                        filled: false,
                      ),

                      ExpansionData(
                        label: 'Update profile',
                        icon: HugeIcons.strokeRoundedProfile02,
                        routeTo: Routes.profileUpdate,
                      ),
                    ],
                    'Persornal Info',
                    HugeIcons.strokeRoundedUserAccount,
                    context,
                  ),

                  buildMoreActions(
                    [
                      ExpansionData(
                        label: 'Change password',
                        icon: HugeIcons.strokeRoundedResetPassword,
                        routeTo: Routes.changePassword,
                      ),
                      ExpansionData(
                        label: 'Two-factor authentication',
                        icon: HugeIcons.strokeRoundedTwoFactorAccess,
                      ),
                      ExpansionData(
                        label: 'Delete Account',
                        icon: HugeIcons.strokeRoundedDelete03,
                        onTap: () {
                          //  TODO: you should verify account with password before deleteng this account
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CAlertDialog(
                                positiveActionLabel: 'Delete Account',
                                title: 'Delete Account',
                                description:
                                    'Your about to delete your account this action is irriversible',
                                onTapPositiveAction: () {
                                  // delete process
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                    'Account & Security',
                    HugeIcons.strokeRoundedAccountSetting03,
                    context,
                  ),

                  buildMoreActions(
                    [
                      ExpansionData(
                        label: 'Notification preferences',
                        icon: HugeIcons.strokeRoundedNotification01,
                      ),
                      ExpansionData(
                        label: 'Language',
                        icon: HugeIcons.strokeRoundedLanguageCircle,
                      ),
                      ExpansionData(
                        label: 'Dark mode toggle',
                        icon: HugeIcons.strokeRoundedDarkMode,
                      ),
                      ExpansionData(
                        label: 'Privacy settings',
                        icon: HugeIcons.strokeRoundedSecurity,
                      ),
                    ],
                    'Settings',
                    HugeIcons.strokeRoundedSettings02,
                    context,
                  ),

                  buildMoreActions(
                    [
                      ExpansionData(
                        label: 'Help / FAQs',
                        icon: HugeIcons.strokeRoundedHelpCircle,
                      ),
                      ExpansionData(
                        label: 'Contact support',
                        icon: HugeIcons.strokeRoundedContact02,
                      ),
                      ExpansionData(
                        label: 'Report a problem',
                        icon: HugeIcons.strokeRoundedSchoolReportCard,
                      ),
                      ExpansionData(
                        label: 'Feedback',
                        icon: HugeIcons.strokeRoundedInformationCircle,
                      ),
                    ],
                    'Support',
                    HugeIcons.strokeRoundedCustomerSupport,
                    context,
                  ),

                  buildMoreActions(
                    [
                      ExpansionData(
                        label: 'Invite a friend',
                        icon: HugeIcons.strokeRoundedShare03,
                      ),
                      ExpansionData(
                        label: 'Rate the app',
                        icon: HugeIcons.strokeRoundedStar,
                      ),
                      ExpansionData(
                        label: 'What’s New / Release Notes',
                        icon: HugeIcons.strokeRoundedAiInnovation01,
                      ),
                    ],
                    'Extras',
                    HugeIcons.strokeRoundedMore,
                    context,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMoreActions(
    List<ExpansionData>? children,
    String title,
    IconData icon,
    BuildContext context,
  ) {
    return CExpansionTile(
      leadingIcon: icon,
      title: title,

      pseudoChildren: List.generate(children!.length, (index) {
        return TouchableOpacity(
          onTap:
              children[index].routeTo != null
                  ? () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed(children[index].routeTo!);
                  }
                  : children[index].onTap,
          child: COutlinedWidget(
            fillColor:
                children[index].filled!
                    ? context.secondary.withAlpha(20)
                    : null,
            // padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HugeIcon(
                    icon: children[index].icon,
                    color: context.primary,
                  ),
                ),
                CText(text: children[index].label),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ExpansionData {
  final String label;
  final IconData icon;
  final String? routeTo;
  final bool? filled;
  final void Function()? onTap;
  ExpansionData({
    required this.label,
    required this.icon,
    this.routeTo,
    this.onTap,
    this.filled = true,
  });
}
