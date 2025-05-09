import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/models/product_model/product_model.dart';
import 'package:vilcom_digital_restaurant/utils/constants/assets.dart';

import 'custom_card.dart';
import 'custom_text.dart';

class ExploreFooItem extends StatelessWidget {
  const ExploreFooItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      // height: 500,
      width: context.screenWidth * 0.4,
      padding: 0,
      border: 0,
      // color: context.primary,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.primary,
                    image: DecorationImage(
                      image: AssetImage(burger),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        text: 'Cheese Burger',
                        size: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        spacing: 1,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedCalendar01,
                            color: context.primary,
                            size: 15,
                          ),
                          CText(
                            text: 'Burger Haven',
                            size: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                        ],
                      ),

                      Row(
                        children: [
                          CText(text: '4.8', fontWeight: FontWeight.w600),
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedStar,
                            color: context.primary,
                            size: 15,
                          ),
                          CText(text: '(335+)', fontWeight: FontWeight.w600),
                        ],
                      ),
                      CText(
                        overflow: true,
                        text: r'$0 Delivery free over $26',
                        color: context.primary,
                        size: 10,
                        // fontWeight: FontWeight.w600,
                      ),

                      Row(
                        children: [
                          CustomCard(
                            padding: 4,
                            color: Colors.black,
                            child: CText(
                              text: r'$8.99',
                              color: Colors.white,
                              size: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          CustomCard(
                            padding: 2,
                            color: Colors.black,
                            child: CHugeIcon(
                              icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            left: 5,
            child: CustomCard(
              // color: Colors.white,
              padding: 2,
              child: Row(
                spacing: 2,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedTime04,
                    color: context.primary,
                    size: 18,
                  ),
                  CText(text: '31 min'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CustomCard(
              color: Colors.white,
              padding: 5,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedFavourite,
                color: context.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
