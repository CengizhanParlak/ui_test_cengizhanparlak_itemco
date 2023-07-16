import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/article_tile_no_image_container.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_loading_indicator.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    required this.url,
    this.hasRadius = false,
    super.key,
  });

  final String url;
  final bool hasRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (_, imageProvider) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(hasRadius ? 8 : 0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (_, __) => const AppLoadingIndicator(),
      errorWidget: (_, __, ___) => const NoImageContainer(),
    );
  }
}
