import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/models/product_model/product_model.dart';
import 'package:vilcom_digital_restaurant/utils/constants/assets.dart';

import 'custom_card.dart';
import 'custom_text.dart';

class HomeFoodItem extends StatelessWidget {
  const HomeFoodItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 230,
      width: 270,
      padding: 0,
      border: 0,

      // color: context.primary,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        text: 'CheeseBurger',
                        size: 15,
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
                            size: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          CText(text: '4.8', fontWeight: FontWeight.w600),
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedStar,
                            color: context.primary,
                            size: 15,
                          ),
                          CText(text: '(335+)', fontWeight: FontWeight.w600),
                        ],
                      ),
                      Row(
                        spacing: 1,
                        children: [
                          CText(
                            text: r'$0 Delivery free over $26',
                            color: context.primary,
                            // size: 13,
                            // fontWeight: FontWeight.w600,
                          ),
                          Spacer(),

                          CustomCard(
                            padding: 4,
                            color: Colors.black,
                            child: Row(
                              spacing: 2,
                              children: [
                                CText(
                                  text: r'$8.99',
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
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
            top: 100,
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
                    size: 20,
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
