import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';
import 'package:ui_test_cengizhanparlak/app/service/articles_service.dart';

class HomeScreenAppBar extends ConsumerWidget {
  const HomeScreenAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leadingWidth: Paddings.kPadding32,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            /// TODO: @CengizhanParlak, 14.07.2023; impl search
          },
          icon: const Icon(Icons.search),
        ),
        const SortButton(),
      ],
    );
  }
}

class SortButton extends ConsumerWidget {
  const SortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType =
        ref.watch(articlesServiceProvider.select((value) => value.sortType));
    return IconButton(
      onPressed: () {
        ref.read(articlesServiceProvider.notifier).switchSort();
      },
      icon: Icon(
        sortType.isAsc ? Icons.arrow_upward : Icons.arrow_downward,
      ),
    );
  }
}
