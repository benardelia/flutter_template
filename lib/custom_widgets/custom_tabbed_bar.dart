import 'package:flutter/material.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/action_button.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key, required this.tabs, this.initialIndex});
  final List<TabData> tabs;
  final int? initialIndex;

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  late int selectedIndex;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex ?? 0;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollToInitialIndex());
  }

  void _scrollToInitialIndex() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        selectedIndex * 100.0, // Adjust based on button width
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: List.generate(widget.tabs.length, (index) {
            final tab = widget.tabs[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
              child: ActionButton(
                label: tab.label,
                filled: selectedIndex == index,
                // count: widget.tabs[index].count,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  if (tab.onTap != null) {
                    tab.onTap!(index);
                  }
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

class TabData {
  final String label;
  final int? count;
  final void Function(int index)? onTap;

  TabData({
    required this.label,
    this.onTap,
    this.count,
  });
}
