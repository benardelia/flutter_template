import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_card.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_list_tile.dart';
import 'package:vilcom_digital_restaurant/models/expansion_tile_data.dart';

import 'custom_text.dart';


class CExpansionTile extends StatelessWidget {
  const CExpansionTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.children,
    this.pseudoChildren,
  });
  final IconData leadingIcon;
  final String title;
  final List<ExpansionTileData>? children;
  final List<Widget>? pseudoChildren;

  Widget buildList() {
    List<Widget> finalChildren = [];

    if (children != null && children!.isNotEmpty) {
      finalChildren.add(
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (children!.length / 2).ceil(),
          itemBuilder: (context, index) {
            int firstIndex = index * 2;
            int secondIndex = firstIndex + 1;

            // Safely check if secondIndex is within bounds
            ExpansionTileData? secondItem =
                secondIndex < children!.length ? children![secondIndex] : null;

            return Column(
              children: [
                const Divider(height: 5, color: Colors.grey, thickness: 0.1),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CListTile(item: children![firstIndex])),
                    Expanded(
                      child:
                          secondItem != null
                              ? CListTile(item: secondItem)
                              : Container(), // Empty container for odd items
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    // Append pseudoChildren at the bottom if both exist
    if (pseudoChildren != null && pseudoChildren!.isNotEmpty) {
      finalChildren.addAll(pseudoChildren!);
    }

    return Column(children: finalChildren);
  }

  @override
  Widget build(BuildContext context) {
    IconData icon = HugeIcons.strokeRoundedArrowDown01;
    return CustomCard(
      padding: 2,
      borderRadius: 10,
      bColor: context.shadow,
      width: double.infinity,
      child: StatefulBuilder(
        builder: (context, setState) {
          return ExpansionTile(
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            childrenPadding: const EdgeInsets.all(8),
            trailing: HugeIcon(icon: icon, color: context.primary, size: 18),
            initiallyExpanded: false,
            onExpansionChanged: (value) {
              setState(() {
                if (value) {
                  icon = HugeIcons.strokeRoundedArrowDown01;
                } else {
                  icon = HugeIcons.strokeRoundedArrowRight01;
                }
              });
            },
            title: Row(
              spacing: 8,
              children: [
                HugeIcon(
                  icon: leadingIcon,
                  color: context.primary,
                  size: 18,
                ),
                CText(text: title, size: 14, fontWeight: FontWeight.w600),
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            collapsedShape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            children: [buildList()],
          );
        },
      ),
    );
  }
}

class AppThemeColor {}
