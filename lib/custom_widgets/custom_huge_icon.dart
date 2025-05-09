import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';

class CHugeIcon extends StatelessWidget {
  final IconData icon;
  final Color? color; // Nullable to allow default
  final double? size; // Example of other properties

  const CHugeIcon({
    super.key,
    required this.icon,
    this.color, // Optional color
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return HugeIcon(
      icon: icon,
      color: color ?? context.primaryColor, // Default to primary color
      size: size ?? 24.0, // Default size if not provided
    );
  }
}
