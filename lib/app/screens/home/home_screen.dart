import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/repository/most_popular_repository.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_app_bar.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_drawer.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getMostPopular =
        ref.watch(GetMostPopularProvider(period: Period.week));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 64),
        child: const HomeScreenAppBar(),
      ),
      drawer: const AppDrawer(),
      body: getMostPopular.when(
        data: (data) {
          if (data == null) {
            return const Center(child: Text('No Data'));
          }
          return ListView.builder(
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              final result = data.results[index];
              return ListTile(
                title: Text(result.title),
                subtitle: Text(result.resultAbstract),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await ref
              .read(mostPopularRepoProvider)
              .getMostPopular(period: Period.week);
          print(res);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
