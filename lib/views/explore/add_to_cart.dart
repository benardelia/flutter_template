import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_card.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_huge_icon.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';
import 'package:vilcom_digital_restaurant/utils/constants/assets.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomCard(
          padding: 8,
          color: context.primary,
          child: Row(
            children: [
              SizedBox(width: 15),
              CText(
                text: 'Add to Cart',
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              CustomCard(
                padding: 6,
                hasShadow: false,
                color: Colors.black.withAlpha(50),
                child: Row(
                  spacing: 15,
                  children: [
                    TouchableOpacity(
                      child: CHugeIcon(
                        icon: HugeIcons.strokeRoundedRemove01,
                        color: Colors.white,
                      ),
                    ),
                    CText(
                      text: '1',
                      size: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    TouchableOpacity(
                      child: CHugeIcon(
                        icon: HugeIcons.strokeRoundedAdd01,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: CHugeIcon(icon: HugeIcons.strokeRoundedCancel01),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CHugeIcon(icon: HugeIcons.strokeRoundedShare05),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CHugeIcon(
              icon: HugeIcons.strokeRoundedFavourite,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Stack(
                children: [
                  Container(
                    height: context.screenHeight * 0.3,
                    decoration: BoxDecoration(
                      color: context.primary,
                      image: DecorationImage(
                        image: AssetImage(burger),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: CustomCard(
                      padding: 4,
                      color: context.primary,
                      child: Row(
                        spacing: 2,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: CText(
                              text: r'$8.99',
                              color: Colors.white,
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 3,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CText(
                        text: 'Cheese Burger',
                        size: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CHugeIcon(icon: HugeIcons.strokeRoundedFire),
                      CText(text: "127 cal", size: 18),
                    ],
                  ),

                  CText(
                    overflow: true,
                    size: 16,
                    text: r'$0 Delivery free over $26',
                    color: context.primary,
                    // size: 13,
                    // fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              // SizedBox(height: 5),
              CText(text: 'Ingredients', size: 20, fontWeight: FontWeight.w600),
              ListView.builder(
                itemCount: 3, // (children!.length / 2).ceil(),
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  var firstChild = index * 2;
                  var secondChild = firstChild + 1;
                  return Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5,
                      children: [
                        Row(
                          children: [
                            CHugeIcon(
                              icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                              size: 20,
                            ),
                            CText(text: 'Ingredient $firstChild'),
                          ],
                        ),
                        Row(
                          children: [
                            CHugeIcon(
                              icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                              size: 20,
                            ),
                            CText(text: 'Ingredient $secondChild'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              CustomCard(
                color: Colors.blueGrey.withAlpha(40),
                hasShadow: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2,
                      ),
                      child: CText(
                        text: 'Variants',
                        size: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Row(
                      children: [
                        Radio(value: 1, groupValue: 2, onChanged: (val) {}),
                        CText(
                          text: 'Small',
                          size: 18,
                          // fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        CText(
                          text: '\$ 8.99',
                          size: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: 2, groupValue: 2, onChanged: (val) {}),
                        CText(
                          text: 'Medium',
                          size: 18,
                          // fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        CText(
                          text: '\$ 9.99',
                          size: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: 1, groupValue: 2, onChanged: (val) {}),
                        CText(
                          text: 'Large',
                          size: 18,
                          // fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        CText(
                          text: '\$ 10.99',
                          size: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
