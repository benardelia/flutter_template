import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'custom_card.dart';
import 'custom_text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onTap,
    required this.label,
    this.filled = true,
    this.color = Colors.white,
    this.leading,
    this.icon,
  });

  final void Function()? onTap;
  final String label;
  final bool? filled;
  final Color? color;
  final Widget? leading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: CustomCard(
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: const EdgeInsets.only(right: 8.0), child: leading),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: HugeIcon(
                  icon: icon ?? HugeIcons.strokeRoundedAcceleration,
                  color:
                      filled!
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorLight,
                  size: 18,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CText(
                text: label,
                color:
                    !filled!
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
