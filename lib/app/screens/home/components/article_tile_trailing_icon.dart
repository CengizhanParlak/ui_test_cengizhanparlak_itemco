import 'package:flutter/material.dart';

class ArticleTrailingIcon extends StatelessWidget {
  const ArticleTrailingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
