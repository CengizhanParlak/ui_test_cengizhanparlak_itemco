import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/components/article_screen_appbar.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/components/article_screen_brief_view.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/components/article_screen_fab.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/components/article_screen_html_view.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen(this.article, {super.key});
  final Article article;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen> {
  late final url = widget.article.url;
  late final article = widget.article;
  bool isFromHTML = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 48),
        child: const ArticleScreenAppBar(),
      ),
      body: isFromHTML
          ? ArticleScreenHTMLView(url)
          : ArticleScreenBriefView(article),
      floatingActionButton: ArticleScreenFAB(
        isFromHTML: isFromHTML,
        onPressed: () {
          setState(() {
            isFromHTML = !isFromHTML;
          });
        },
      ),
    );
  }
}
