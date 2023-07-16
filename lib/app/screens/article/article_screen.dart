import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_cached_network_image.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (article.hasImage)
              Hero(
                tag: article.id,
                child: SizedBox(
                  height: context.maxWidthByRatio(maxWidth: 390, ratio: 1),
                  width: context.maxWidthByRatio(maxWidth: 390, ratio: 1),
                  child: AppCachedNetworkImage(
                    url: article.media.first.mediaMetadata.last.url,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                article.resultAbstract,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
