import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';

part 'article_repository.g.dart';

@riverpod
Future<Either<ApiError, String?>> getArticle(
  Ref ref, {
  required String url,
}) async {
  final response = await Client().get(Uri.parse(url));
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    if (response.body.contains('DOCTYPE')) {
      return Right(response.body);
    }
    return const Right(null);
  } else {
    final statusCode = response.statusCode;
    if (statusCode == 401) {
      return const Left(unauthorizedError);
    } else if (statusCode == 404) {
      return const Left(notFoundError);
    } else if (statusCode == 429) {
      return const Left(tooManyRequestsError);
    }
    return const Left(unknownError);
  }
}
