import 'package:flutter/material.dart';

class CBCircle extends StatelessWidget {
  const CBCircle({
    super.key,
    this.theme,
    this.child,
    this.height,
    this.width,
    this.border,
    this.borderColor,
    this.bWidth,
    this.padding,
    this.shadow,
  });

  final Color? theme;
  final Widget? child;
  final double? height;
  final double? width;
  final double? border;
  final Color? borderColor;
  final double? bWidth;
  final double? padding;
  final bool? shadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.extralong1,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border ?? 0),
        border: Border.all(
          width: bWidth ?? 1,
          color:
              borderColor ??
              Theme.of(
                context,
              ).colorScheme.surfaceBright.withValues(alpha: 0.2),
        ),
        color: theme ?? Theme.of(context).colorScheme.surfaceBright,

        // boxShadow: [
        //   if (shadow == true) ...[Styles.iShadow]
        // ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0, vertical: 0),
        child: child,
      ),
    );
  }
}
