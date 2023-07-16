import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/repository/article_repository.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_error_text.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_loading_indicator.dart';

class ArticleScreenHTMLView extends ConsumerWidget {
  const ArticleScreenHTMLView(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(GetArticleProvider(url: url)).when(
          data: (data) {
            if (data?.isEmpty ?? true) {
              return Column(
                children: [
                  const ErrorText(text: 'No data found'),
                  ElevatedButton(
                    onPressed: () => ref.refresh(
                      GetArticleProvider(url: url),
                    ),
                    child: const Text('Refresh'),
                  ),
                ],
              );
            }
            return SingleChildScrollView(child: Html(data: data));
          },
          error: (e, s) => ErrorText(text: e.toString()),
          loading: AppLoadingIndicator.new,
        );
  }
}
