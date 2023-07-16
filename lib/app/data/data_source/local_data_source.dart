import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';

abstract class LocalDataSource {
  Future<void> cacheMostPopular(MostPopular mostPopular);
  Future<MostPopular?> getCachedMostPopular();
  Future<Locale?> getCachedLocale();
  Future<void> cacheLocale(Locale locale);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheMostPopular(MostPopular mostPopular) async {
    await sharedPreferences.setString(
      'mostPopular',
      jsonEncode(mostPopular.toJson()),
    );
  }

  @override
  Future<MostPopular?> getCachedMostPopular() async {
    final mostPopularString = sharedPreferences.getString('mostPopular');
    if (mostPopularString != null) {
      final map = jsonDecode(mostPopularString) as Map<String, dynamic>;
      return MostPopular.fromJson(map);
    } else {
      return null;
    }
  }

  @override
  Future<Locale?> getCachedLocale() async {
    final localeString = sharedPreferences.getString('locale');
    if (localeString != null) {
      final map = jsonDecode(localeString) as Map<String, dynamic>;
      return Locale(
        map['languageCode'] as String,
        map['countryCode'] as String,
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> cacheLocale(Locale locale) async {
    await sharedPreferences.setString(
      'locale',
      jsonEncode({
        'languageCode': locale.languageCode,
        'countryCode': locale.countryCode,
      }),
    );
  }
}
