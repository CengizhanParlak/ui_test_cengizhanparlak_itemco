// ignore_for_file: always_put_control_body_on_new_line

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_article_tile.dart';
import 'package:ui_test_cengizhanparlak/app/service/articles_service.dart';

class ArticlesListView extends ConsumerWidget {
  const ArticlesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articlesServiceProvider).filteredArticles;
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
