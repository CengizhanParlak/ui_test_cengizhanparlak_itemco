// ignore_for_file: always_put_control_body_on_new_line

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_app_bar.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_body.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_drawer.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 64),
        child: const HomeScreenAppBar(),
      ),
      drawer: const AppDrawer(),
      body: const HomeScreenBody(),
    );
  }
}
