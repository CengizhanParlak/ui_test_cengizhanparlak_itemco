import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_test_cengizhanparlak/app/constant/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/endpoints.dart';
import 'package:ui_test_cengizhanparlak/app/model/api_model.dart';
import 'package:ui_test_cengizhanparlak/app/model/most_popular_model.dart';
import 'package:http/http.dart' as http;
import 'package:ui_test_cengizhanparlak/app/service/most_popular_service.dart';

part 'most_popular_repository.g.dart';

// ignore: one_member_abstracts
abstract class MostPopularRepository {
  Future<MostPopular?> getMostPopular({required Period period});
}

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

@riverpod
Future<MostPopular?> getMostPopular(
  GetMostPopularRef ref, {
  required Period period,
}) async {
  ref.onDispose(() {
    ref.read(mostPopularServiceProvider).article = null;
  });
  final mostPopularRepo = ref.read(mostPopularRepoProvider);
  try {
    await Future<void>.delayed(const Duration(seconds: 1));
    final mostPopular = await mostPopularRepo.getMostPopular(period: period);
    return mostPopular;
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
    return null;
  }
}

class MostPopularRepoImpl implements MostPopularRepository {
  MostPopularRepoImpl({required this.api, required this.client});

  final http.Client client;

  final ApiModel api;

  @override
  Future<MostPopular?> getMostPopular({required Period period}) async {
    // final response = await client.get(
    //   Uri.parse('${api.endpoint}/${period.asInt}.json?api-key=${api.apiKey}'),
    // );
    final json = await rootBundle.loadString('assets/response.json');
    final response = Response(
      json,
      200,
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
    );
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      if (response.body == '[]') {
        // showToast(LocaleKeys.noDataFound.translate);-
        return null;
      }
      final responseBody = jsonDecode(response.body);
      if (responseBody is Map<String, dynamic>) {
        return MostPopular.fromJson(responseBody);
      } else {
        // showToast(LocaleKeys.noDataFound.translate);
        return null;
      }
    } else {
      // showToast(LocaleKeys.failedToFetch.translate);
      return null;
    }
  }
}
