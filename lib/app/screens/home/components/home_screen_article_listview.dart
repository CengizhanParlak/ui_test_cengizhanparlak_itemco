// ignore_for_file: always_put_control_body_on_new_line

import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_article_tile.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    required this.articles,
    super.key,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      itemBuilder: (_, idx) {
        final isFirst = idx == 0;
        final isLast = idx == articles.length - 1;
        return Column(
          children: [
            if (isFirst) const SizedBox(height: Paddings.kPadding24),
            ArticleTile(article: articles[idx]),
            if (isLast) const SizedBox(height: Paddings.kPadding24),
          ],
        );
      },
      separatorBuilder: (_, idx) => const Divider(height: 36),
    );
  }
}
