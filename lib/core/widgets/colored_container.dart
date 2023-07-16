import 'package:flutter/material.dart';

class Colored extends StatelessWidget {
  const Colored._({required this.color, required this.child});

  factory Colored.blue({required Widget child}) =>
      Colored._(color: Colors.blue, child: child);

  factory Colored.red({required Widget child}) =>
      Colored._(color: Colors.red, child: child);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: child,
    );
  }
}
