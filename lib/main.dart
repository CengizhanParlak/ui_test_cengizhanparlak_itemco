import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/app_info.dart';
import 'package:ui_test_cengizhanparlak/app/controller/language_controller.dart';
import 'package:ui_test_cengizhanparlak/app/controller/theme_controller.dart';
import 'package:ui_test_cengizhanparlak/app/route/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(const NYTimesApp());
}

class NYTimesApp extends StatelessWidget {
  const NYTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        supportedLocales: LanguageController.supportedLocales,
        path: LanguageController.langsPath,
        startLocale: LanguageController.enLocale,
        fallbackLocale: LanguageController.enLocale,
        useOnlyLangCode: true,
        child: const AppStart(),
      ),
    );
  }
}

class AppStart extends ConsumerWidget {
  const AppStart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppInfo.appName,
      theme: ref.watch(themeProvider).theme,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      builder: BotToastInit(),
      routerConfig: appRouter,
    );
  }
}
