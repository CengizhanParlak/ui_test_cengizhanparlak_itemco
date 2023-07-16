import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_no_image_container.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_cached_network_image.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (article.hasImage)
          Hero(
            tag: article.id,
            child: SizedBox(
              height: 48,
              width: 48,
              child: AppCachedNetworkImage(
                url: article.media.first.mediaMetadata.last.url,
                hasRadius: true,
              ),
            ),
          )
        else
          const NoImageContainer(),
      ],
    );
  }
}
