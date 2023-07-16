// GoRouter configuration
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_test_cengizhanparlak/app/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/article/article_screen.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/home_screen.dart';

final appRouter = GoRouter(
  observers: [BotToastNavigatorObserver()],
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'article',
          name: 'article',
          builder: (context, state) {
            final sample = state.extra as Article?;
            return ArticleScreen(sample!);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Something went wrong!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => appRouter.push('/'),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
