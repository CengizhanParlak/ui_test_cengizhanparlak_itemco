import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_leading_image.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/datetime_extension.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/textstyle_extension.dart';

class ArticleScreen extends ConsumerWidget {
  const ArticleScreen(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = context.maxWidthByRatio(maxWidth: 390, ratio: 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Paddings.kPadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Paddings.kPadding8),
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
      ),
    );
  }
}

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
