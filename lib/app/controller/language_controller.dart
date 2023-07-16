import 'package:flutter/material.dart';

class LanguageController {
  static const fallbackLocale = enLocale;

  static const langsPath = 'resources/langs';

  static const supportedLocales = [
    trLocale,
    enLocale,
  ];

  static const trLocale = Locale('tr', 'TR');
  static const enLocale = Locale('en', 'US');
}
