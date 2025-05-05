import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/styles/input_decorator.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/bordered_container.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_card.dart';
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
                      color: Colors.black,
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

            CustomCard(
              height: 190,
              width: 400,
              color: context.primary,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Use code "),
                      CustomCard(
                        height: 38,
                        width: 80,
                        color: Colors.white,
                        child: Text("First50"),
                      ),
                      Text(" at checkout"),
                    ],
                  ),
                  Text("Hurry, offer ends soon!"),

                  Text("Get 50% Off"),
                  Text("Your First Order!"),
                  Row(
                    children: [
                      Text(""),
                      Spacer(),
                      TextButton(
                        style: ButtonStyle(),
                        onPressed: () {},
                        child: Text(
                          "Order Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 100, // Adjust height to fit the cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Column(
                      children: [
                        CustomCard(
                          color: context.primary,
                          child: Icon(category['icon'], size: 50),
                        ),
                        const SizedBox(height: 5),
                        Text(category['label']),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                CText(
                  text: "Top picks on delivo™",
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
