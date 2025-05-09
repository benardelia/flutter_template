import 'package:flutter/material.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import '../models/expansion_tile_data.dart';
import 'custom_text.dart';

class CListTile extends StatelessWidget {
  const CListTile({super.key, required this.item});
  final ExpansionTileData item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            text: item.label,
            fontWeight: FontWeight.w500,
            color: context.secondary,
          ),
          item.data,
        ],
      ),
    );
  }
}
