import 'package:flutter/material.dart';

class AnimatedRouteBuilder<T> extends PageRoute<T> {
  AnimatedRouteBuilder({
    required this.child,
    int? transitionDuration,
    this.transitionType = PageTransitionType.slideRTL,
  }) : _transitionDuration = transitionDuration ?? 500;

  final PageTransitionType transitionType;

  final Widget child;

  final int _transitionDuration;

  @override
  Duration get transitionDuration =>
      Duration(milliseconds: _transitionDuration);

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  bool get fullscreenDialog => false;

  @override
  String? get barrierLabel => null;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    animation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOutCubic,
    );
    switch (transitionType) {
      case PageTransitionType.fadeIn:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case PageTransitionType.fadeOut:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case PageTransitionType.slideLTR:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case PageTransitionType.slideRTL:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case PageTransitionType.slideTTB:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case PageTransitionType.slideBTT:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case PageTransitionType.scale:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: child,
        );
      case PageTransitionType.none:
        return child;
    }
  }
}

enum PageTransitionType {
  fadeIn,
  fadeOut,
  slideLTR,
  slideRTL,
  slideTTB,
  slideBTT,
  scale,
  none
}
