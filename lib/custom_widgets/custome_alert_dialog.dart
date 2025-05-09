import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'custom_outlined.dart';
import 'custom_text.dart';

class CAlertDialog extends StatelessWidget {
  const CAlertDialog({
    super.key,
    this.onTapPositiveAction,
    this.title,
    this.description,
    this.positiveActionLabel,
    this.negativeActionLabel,
    this.contents,
    this.positiveActionColor,
    this.negativeActionColor,
  });
  final void Function()? onTapPositiveAction;
  final String? title;
  final String? description;
  final String? positiveActionLabel;
  final String? negativeActionLabel;
  final Widget? contents;
  final Color? positiveActionColor;
  final Color? negativeActionColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CText(
        text: title ?? 'Attention',
        fontWeight: FontWeight.bold,
        size: 15,
        // style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CText(text: description ?? "Are you sure?"),
          contents ?? const SizedBox(),
        ],
      ),
      actions: <Widget>[
        TouchableOpacity(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: COutlinedWidget(
            borderColor: Colors.green,
            borderRadius: 30,
            borderWidth: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 2,
              ),
              child: CText(text: negativeActionLabel ?? 'Cancel'),
            ),
          ),
        ),
        TouchableOpacity(
          onTap: onTapPositiveAction,
          child: COutlinedWidget(
            fillColor: positiveActionColor ?? Colors.red,
            borderColor: positiveActionColor ?? Colors.red,
            borderRadius: 30,
            borderWidth: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 2,
              ),
              child: CText(
                text: positiveActionLabel ?? 'Continue',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
