import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get topPadding => MediaQuery.of(this).padding.top;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  double widthByRatio({required double ratio}) => width * ratio;

  double maxWidth({required double maxWidth}) {
    return width > maxWidth ? maxWidth : width;
  }

  double maxWidthByRatio({
    required double maxWidth,
    required double ratio,
  }) {
    return width * ratio > maxWidth ? maxWidth : width * ratio;
  }

  double maxHeight({required double maxHeight}) {
    return height > maxHeight ? maxHeight : height;
  }

  double heightByRatio({required double ratio}) => height * ratio;

  double maxHeightByRatio({
    required double maxHeight,
    required double ratio,
  }) {
    return height * ratio > maxHeight ? maxHeight : height * ratio;
  }

  void unfocus() => FocusManager.instance.primaryFocus?.unfocus();
}
