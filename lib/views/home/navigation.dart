import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/views/explore/add_to_cart.dart';
import 'package:vilcom_digital_restaurant/views/explore/explore.dart';
import 'package:vilcom_digital_restaurant/views/home/homepage.dart';
import 'package:vilcom_digital_restaurant/views/profile/profile.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      // hideNavigationBar: true,
      tabs: [
        PersistentTabConfig(
          navigatorConfig: NavigatorConfig(),
          screen: HomePage(),
          item: CItemConfig(
            context: context,
            icon: HugeIcons.strokeRoundedHome03,
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: Explore(),
          item: CItemConfig(
            context: context,
            icon: HugeIcons.strokeRoundedSearchList01,
            title: "Explore",
          ),
        ),

        PersistentTabConfig(
          screen: AddToCart(),
          item: CItemConfig(
            context: context,
            icon: HugeIcons.strokeRoundedShoppingCart01,
            title: "Cart",
          ),
        ),
        PersistentTabConfig(
          screen: Profile(),
          item: CItemConfig(
            context: context,
            icon: HugeIcons.strokeRoundedUserAccount,
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder:
          (navBarConfig) => Style2BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}

class CItemConfig extends ItemConfig {
  CItemConfig({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) : super(
         icon: CHugeIcon(icon: icon),
         title: title,
         activeForegroundColor: context.primary,
         textStyle: TextStyle(
           color: context.primary,
           fontSize: 12,
           fontWeight: FontWeight.w600,
         ),
         inactiveIcon: CHugeIcon(icon: icon, color: CupertinoColors.systemGrey),
       );
}
