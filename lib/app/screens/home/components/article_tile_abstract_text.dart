import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class ArticleAbstract extends StatelessWidget {
  const ArticleAbstract({
    required this.resultAbstract,
    super.key,
  });

  final String resultAbstract;

  @override
  Widget build(BuildContext context) {
    return Text(
      resultAbstract,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.bodyMedium,
    );
  }
}
