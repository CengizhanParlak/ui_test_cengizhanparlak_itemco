import 'package:flutter/painting.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? get white {
    return this?.copyWith(
      color: const Color(0xFFFFFFFF),
    );
  }

  TextStyle? get black {
    return this?.copyWith(
      color: const Color(0xFF000000),
    );
  }
}
