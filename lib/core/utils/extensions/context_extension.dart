import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/route/route_builder.dart';

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

extension NavigatorExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushAndRemoveUntil<T extends Widget, O extends Object?>(
    T page, {
    O? lastRemainingWidget,
    bool isRoot = false,
  }) {
    assert(
      !(lastRemainingWidget == null && isRoot == false),
      'lastRemainingWidget and isRoot cannot be false and null at the same time',
    );
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) {
        if (isRoot) {
          return false;
        }
        if (route is O) {
          return true;
        }
        return false;
      },
    );
  }

  Future<T?> pushReplacement<T extends Widget, O extends Widget?>(T page) {
    return Navigator.of(this)
        .pushReplacement<T, O>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushWithAnimation<T extends Widget>(
    T page, {
    PageTransitionType transitionType = PageTransitionType.slideRTL,
    int? transitionDuration,
  }) {
    return Navigator.of(this).push<T>(
      AnimatedRouteBuilder(
        child: page,
        transitionType: transitionType,
        transitionDuration: transitionDuration,
      ),
    );
  }

  /// If you want to remove all routes until root, pass void as [O], and set
  /// [isRoot] to true.
  Future<T?>
      pushAndRemoveUntilWithAnimation<T extends Widget, O extends Object?>(
    T page, {
    O? lastRemainingWidget,
    bool isRoot = false,
    PageTransitionType transitionType = PageTransitionType.slideRTL,
    int? transitionDuration,
  }) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
        AnimatedRouteBuilder<T>(
          child: page,
          transitionType: transitionType,
          transitionDuration: transitionDuration,
        ), (route) {
      if (isRoot) {
        return false;
      }
      if (route is AnimatedRouteBuilder<O> || route is MaterialPageRoute<O>) {
        return true;
      }
      return false;
    });
  }

  Future<T?> pushReplacementWithAnimation<T extends Widget, O extends Object?>(
    T page, {
    PageTransitionType transitionType = PageTransitionType.slideRTL,
    int? transitionDuration,
  }) {
    return Navigator.of(this).pushReplacement<T, O>(
      AnimatedRouteBuilder<T>(
        child: page,
        transitionType: transitionType,
        transitionDuration: transitionDuration,
      ),
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil<T extends Widget>() {
    Navigator.of(this).popUntil((route) {
      if (route is AnimatedRouteBuilder<T> || route is MaterialPageRoute<T>) {
        return true;
      }
      return false;
    });
  }

  void popUntilRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  void maybePop<T extends Object?>([T? result]) {
    Navigator.of(this).maybePop(result);
  }
}
