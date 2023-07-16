import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/route/app_router.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_abstract_text.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_leading_image.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_trailing_icon.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/datetime_extension.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appRouter.goNamed('article', extra: article),
      child: ListTile(
        leading: ArticleImage(article: article),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title, style: context.headlineSmall),
            const SizedBox(height: Paddings.kPadding8),
            Text(
              article.publishedDate.toFormattedString,
              style: context.titleMedium,
            ),
            const SizedBox(height: Paddings.kPadding8),
            Text(
              article.byline,
              style: context.titleMedium.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: Paddings.kPadding12),
          child: ArticleAbstract(resultAbstract: article.resultAbstract),
        ),
        trailing: const ArticleTrailingIcon(),
      ),
    );
  }
}
