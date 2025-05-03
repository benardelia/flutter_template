import 'package:flutter/material.dart';

extension ScreenSizesExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenAspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get screenPixelRatio => MediaQuery.of(this).devicePixelRatio;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

}
