import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/datetime_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/textstyle_extension.dart';

class ArticleImageDateText extends StatelessWidget {
  const ArticleImageDateText({
    required this.publishedDate,
    super.key,
  });

  final DateTime publishedDate;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -10,
      bottom: 10,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          publishedDate.toFormattedString,
          style: context.bodyMedium.white,
        ),
      ),
    );
  }
}
