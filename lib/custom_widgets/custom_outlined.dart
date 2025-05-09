import 'package:flutter/material.dart';
import 'package:vilcom_digital_restaurant/config/theme_color_extension.dart';

class COutlinedWidget extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? fillColor;

  const COutlinedWidget({
    super.key,
    required this.child,
    this.borderColor,
    this.borderWidth = 0.5,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.all(5.0),
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: borderColor ?? context.primary,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
