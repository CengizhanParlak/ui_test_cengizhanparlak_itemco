import 'package:flutter/material.dart';

class LanguageService {
  LanguageService._();

  static Locale appLocale = fallbackLocale;

  static const fallbackLocale = enLocale;

  static const langsPath = 'resources/langs';

  static const supportedLocales = [
    trLocale,
    enLocale,
  ];

  static const trLocale = Locale('tr', 'TR');
  static const enLocale = Locale('en', 'US');
}
