import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/textstyle_extension.dart';

class ArticleScreenFAB extends ConsumerWidget {
  const ArticleScreenFAB({
    required this.isFromHTML,
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isFromHTML;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: context.theme.primaryColor,
      icon: isFromHTML
          ? const Icon(Icons.article_outlined, color: Colors.white)
          : const Icon(Icons.article, color: Colors.white),
      label: isFromHTML
          ? Text('HTML', style: context.bodyMedium.white)
          : Text('Brief', style: context.bodyMedium.white),
    );
  }
}
