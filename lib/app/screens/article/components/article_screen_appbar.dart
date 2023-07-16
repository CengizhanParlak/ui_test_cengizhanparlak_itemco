import 'package:flutter/material.dart';

class ArticleScreenAppBar extends StatelessWidget {
  const ArticleScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('NY Times'),
      centerTitle: true,
    );
  }
}
