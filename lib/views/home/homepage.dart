import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vilcom_digital_restaurant/config/screen_sizes_extension.dart';
import 'package:vilcom_digital_restaurant/config/styles/input_decorator.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/bordered_container.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_card.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/food_category_item.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/home_food_item.dart';
import 'package:vilcom_digital_restaurant/models/product_model/product_model.dart';

import '../../custom_widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {'icon': HugeIcons.strokeRoundedFishFood, 'label': 'Burger'},
    {'icon': HugeIcons.strokeRoundedFishFood, 'label': 'Pizza'},
    {'icon': HugeIcons.strokeRoundedNaturalFood, 'label': 'Salad'},
    {'icon': HugeIcons.strokeRoundedFishFood, 'label': 'Sushi'},
    {'icon': HugeIcons.strokeRoundedNaturalFood, 'label': 'Salad'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 60),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLocation01,
                      color: context.primary,
                    ),
                    const Text("Tanzania"),
                    const Icon(HugeIcons.strokeRoundedArrowDown01),
                  ],
                ),
                Spacer(),
                Icon(HugeIcons.strokeRoundedNotification03),
              ],
            ),

            TextField(
              decoration: InputDecorationX.decorator(
                label: 'Search',
                icon: HugeIcons.strokeRoundedSearch01,
                suffixIcon: CBCircle(
                  border: 40,
                  theme: context.primary.withAlpha(50),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedMic01,
                    color: context.primary,
                  ),
                ),
              ),
            ),

            CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CustomCard(
                          color: context.primary,

                          child: Column(
                            spacing: 6,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CText(text: "Use code ", color: Colors.white),
                                  CustomCard(
                                    padding: 0,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0,
                                      ),
                                      child: CText(
                                        text: "FIRST 50",
                                        color: context.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  CText(
                                    text: " at checkout.",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              CText(
                                text: "Hurry, offer ends soon!",
                                color: Colors.white,
                              ),

                              Column(
                                spacing: 0,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: "Get 50% Off",
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CText(
                                    text: "Your First Order!",
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  TouchableOpacity(
                                    child: CustomCard(
                                      padding: 0,
                                      color: Colors.black,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0,
                                          vertical: 4,
                                        ),
                                        child: CText(
                                          text: "Order Now",
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
              options: CarouselOptions(autoPlay: true, enlargeFactor: 0),
            ),

            SizedBox(
              height: 100, // Adjust height to fit the cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return FoodCategoryItem(name: category['label']);
                },
              ),
            ),
            Row(
              children: [
                CText(
                  text: "Top picks on delivery™",
                  size: 20,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("See All")),
              ],
            ),
            SizedBox(
              height: 235,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: HomeFoodItem(product: ProductModel()),
                  );
                },
              ),
            ),
            // Row(children: [HomeFoodItem()]),
          ],
        ),
      ),
    );
  }
}
