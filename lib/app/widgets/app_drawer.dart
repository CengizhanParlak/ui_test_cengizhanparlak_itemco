import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/app_info.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/colors.dart';
import 'package:ui_test_cengizhanparlak/app/controller/language_controller.dart';
import 'package:ui_test_cengizhanparlak/app/controller/theme_controller.dart';
import 'package:ui_test_cengizhanparlak/core/utils/extensions/context_extension.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.greenMainLight,
            ),
            child: Text(
              AppInfo.appName,
              style: context.textTheme.displayLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('Türkçe'),
            trailing: const Text('🇹🇷', style: TextStyle(fontSize: 24)),
            onTap: () async {
              await changeLocale(context, LanguageController.trLocale);
            },
          ),
          ListTile(
            title: const Text('English'),
            trailing: const Text('🇺🇸', style: TextStyle(fontSize: 24)),
            onTap: () async {
              await changeLocale(context, LanguageController.enLocale);
            },
          ),
          SwitchListTile.adaptive(
            title: const Text('Dark Mode'),
            contentPadding: const EdgeInsets.only(left: 16, right: 8),
            value: ref.watch(themeProvider).isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).changeTheme();
            },
          ),
        ],
      ),
    );
  }

  Future<void> changeLocale(BuildContext context, Locale locale) async {
    // final language = locale.languageCode.tr();
    // final toastMessage = LocaleKeys.languageChanged.tr(args: [language]);
    await context.setLocale(locale).then((value) {
      Scaffold.of(context).closeDrawer();
    });
    // showToast(toastMessage);
  }
}
