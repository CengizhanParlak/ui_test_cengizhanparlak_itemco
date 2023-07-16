import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/components/article_image_publish_date_text.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_leading_image.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class ArticleScreenBriefView extends ConsumerWidget {
  const ArticleScreenBriefView(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = context.maxWidthByRatio(maxWidth: 390, ratio: 1);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Paddings.kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Paddings.kPadding8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ArticleImage(
                    article: article,
                    width: width,
                    height: width,
                  ),
                  ArticleImageDateText(publishedDate: article.publishedDate),
                ],
              ),
            ),
            Text(article.title, style: context.displayLarge),
            const SizedBox(height: Paddings.kPadding12),
            Text(article.byline, style: context.titleSmall),
            const SizedBox(height: Paddings.kPadding24),
            Text(article.resultAbstract, style: context.bodyLarge),
          ],
        ),
      ),
    );
  }
}
