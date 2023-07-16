import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/paddings.dart';

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
        IconButton(
          onPressed: () {
            /// TODO: @CengizhanParlak, 14.07.2023; impl sort by publish date
          },
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ],
    );
  }
}
