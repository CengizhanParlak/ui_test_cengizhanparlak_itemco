import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/repository/article_repository.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_error_text.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_loading_indicator.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/no_data_text.dart';

class ArticleScreenHTMLView extends ConsumerWidget {
  const ArticleScreenHTMLView(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(GetArticleProvider(url: url)).when(
          data: (result) {
            return result.fold(
              (left) {
                return ErrorText(
                  text: left.errorType.message,
                  refresh: () {
                    return ref.refresh(
                      GetArticleProvider(url: url),
                    );
                  },
                );
              },
              (right) {
                if (right?.isEmpty ?? true) {
                  return NoDataText(
                    refresh: () {
                      return ref.refresh(
                        GetArticleProvider(url: url),
                      );
                    },
                  );
                }
                return SingleChildScrollView(child: Html(data: right));
              },
            );
          },
          error: (e, s) => ErrorText(text: e.toString()),
          loading: AppLoadingIndicator.new,
        );
  }
}
