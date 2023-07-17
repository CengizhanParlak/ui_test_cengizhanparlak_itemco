import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';

final articleRepoProvider = Provider.autoDispose<ArticleRepositoryImpl>(
  (ref) {
    return ArticleRepositoryImpl(
      client: Client(),
    );
  },
);

// ignore: one_member_abstracts
abstract class ArticleRepository {
  Future<Either<ApiError, String?>> getArticle(String url);
}

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({required this.client});

  final Client client;

  @override
  Future<Either<ApiError, String?>> getArticle(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
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
}
