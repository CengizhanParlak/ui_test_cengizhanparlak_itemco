import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/route/app_router.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_abstract_text.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_leading_image.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_trailing_icon.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

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
        title: Text(article.title, style: context.headlineSmall),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: Paddings.kPadding24),
          child: ArticleAbstract(resultAbstract: article.resultAbstract),
        ),
        trailing: const ArticleTrailingIcon(),
      ),
    );
  }
}
