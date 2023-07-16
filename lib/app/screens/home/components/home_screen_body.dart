// ignore_for_file: always_put_control_body_on_new_line

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_article_listview.dart';
import 'package:ui_test_cengizhanparlak/app/service/most_popular_service.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_error_text.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_loading_indicator.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/no_data_text.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(GetMostPopularProvider(period: Period.week)).when(
          data: (data) {
            if (data?.results.isEmpty ?? true) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NoDataText(),
                  ElevatedButton(
                    onPressed: () => ref.refresh(
                      GetMostPopularProvider(period: Period.week),
                    ),
                    child: const Text('Refresh'),
                  ),
                ],
              );
            }
            return const ArticlesListView();
          },
          loading: () => const AppLoadingIndicator(),
          error: (err, stack) => ErrorText(text: err.toString()),
        );
  }
}
