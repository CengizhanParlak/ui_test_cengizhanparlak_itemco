import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';
import 'package:ui_test_cengizhanparlak/app/repository/most_popular_repository.dart';
import 'package:ui_test_cengizhanparlak/app/service/articles_service.dart';

part 'most_popular_service.g.dart';

@riverpod
Future<Either<ApiError, MostPopular?>> getMostPopular(
  Ref ref, {
  required Period period,
}) async {
  try {
    final repository = ref.read(mostPopularRepoProvider);
    final apiResult = await repository.getMostPopular(period: period);
    if (apiResult.isLeft) {
      return Left(apiResult.left);
    } else {
      ref
          .read(articlesServiceProvider)
          .addArticles(apiResult.right?.results ?? []);
      return Right(apiResult.right);
    }
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
    return const Right(null);
  }
}
