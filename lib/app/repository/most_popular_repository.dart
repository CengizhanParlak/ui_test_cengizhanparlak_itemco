import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/endpoints.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';
import 'package:http/http.dart' as http;

final mostPopularRepoProvider = Provider.autoDispose<MostPopularRepoImpl>(
  (ref) {
    return MostPopularRepoImpl(
      api: const ApiModel(
        endpoint: Endpoints.apiEndpoint,
        apiKey: Endpoints.apiKey,
      ),
      client: http.Client(),
    );
  },
);

// ignore: one_member_abstracts
abstract class MostPopularRepository {
  Future<Either<ApiError, MostPopular?>> getMostPopular({
    required Period period,
  });
}

class MostPopularRepoImpl implements MostPopularRepository {
  MostPopularRepoImpl({required this.api, required this.client});

  final http.Client client;

  final ApiModel api;

  @override
  Future<Either<ApiError, MostPopular?>> getMostPopular({
    required Period period,
  }) async {
    final response = await client.get(
      Uri.parse('${api.endpoint}/${period.asInt}.json?api-key=${api.apiKey}'),
    );
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      if (response.body == '[]') {
        return const Right(null);
      }
      final responseBody = jsonDecode(response.body);
      if (responseBody is Map<String, dynamic>) {
        return Right(MostPopular.fromJson(responseBody));
      } else {
        return const Right(null);
      }
    } else {
      final statusCode = response.statusCode;
      if (statusCode == 401) {
        return const Left(unauthorizedError);
      } else if (statusCode == 404) {
        return const Left(notFoundError);
      } else if (statusCode == 429) {
        return const Left(tooManyRequestsError);
      } else {
        return const Left(unknownError);
      }
    }
  }
}
