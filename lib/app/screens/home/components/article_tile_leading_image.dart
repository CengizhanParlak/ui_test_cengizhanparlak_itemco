import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_no_image_container.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_cached_network_image.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    required this.article,
    this.height = 48,
    this.width = 48,
    super.key,
  });

  final Article article;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (article.hasImage)
          Hero(
            tag: article.id,
            child: SizedBox(
              height: height,
              width: width,
              child: AppCachedNetworkImage(
                url: article.media.first.mediaMetadata.last.url,
                hasRadius: true,
              ),
            ),
          )
        else
          NoImageContainer(
            height: height,
            width: width,
          ),
      ],
    );
  }
}
