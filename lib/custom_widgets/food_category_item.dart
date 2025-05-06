import 'package:flutter/material.dart';

import '../utils/constants/assets.dart';
import 'custom_card.dart';
import 'custom_text.dart';

class FoodCategoryItem extends StatelessWidget {
  const FoodCategoryItem({super.key, required this.name, this.imagePath});
  final String name;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        spacing: 3,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCard(
            padding: 0,
            height: 80,
            width: 80,
            child: Container(
              decoration: BoxDecoration(
                // color: context.primary,
                image: DecorationImage(
                  image: AssetImage(hamburger),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),

          CText(text: name, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
