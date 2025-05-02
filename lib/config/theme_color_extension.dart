import 'package:flutter/material.dart';

// color extensions to reduce color defining writting example instead of
//  Theme.of(context).colorScheme.primary you can write context.primaryColor
// and so on
extension ThemeColorExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get primaryContainerColor =>
      Theme.of(this).colorScheme.primaryContainer;
  Color get onPrimaryContainerColor =>
      Theme.of(this).colorScheme.onPrimaryContainer;
  Color get surfaceTint => Theme.of(this).colorScheme.surfaceTint;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
}
