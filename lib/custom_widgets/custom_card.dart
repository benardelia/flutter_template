import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.child,
      this.borderRadius = 24,
      this.width,
      this.height,
      this.color = Colors.white,
      this.bColor,
      this.border,
      this.padding});
  final Widget child;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final double? border;
  final Color? bColor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Durations.long4,
        width: width,
        height: height,
        padding: EdgeInsets.all(padding ?? 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius!),
            // boxShadow: [
            //   Styles.iShadow
            // ],
            border: Border.all(
                color: bColor ?? Colors.transparent, width: border ?? 1)),
        child: child);
  }
}
