import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';
import 'package:ui_test_cengizhanparlak/app/repository/most_popular_repository.dart';
import 'package:ui_test_cengizhanparlak/app/service/articles_service.dart';

part 'most_popular_service.g.dart';

@riverpod
Future<MostPopular?> getMostPopular(
  GetMostPopularRef ref, {
  required Period period,
}) async {
  try {
    final mostPopularRepo = ref.read(mostPopularRepoProvider);
    final mostPopular = await mostPopularRepo.getMostPopular(period: period);
    ref.read(articlesServiceProvider).addArticles(mostPopular?.results ?? []);
    return mostPopular;
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
    return null;
  }
}
