import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/endpoints.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/api_error_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';
import 'package:ui_test_cengizhanparlak/app/repository/most_popular_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('Most Popular Articles query successful GET operations', () {
    late MostPopularRepoImpl mostPopularRepository;
    late MockHttpClient mockHttpClient;

    const api = ApiModel(
      endpoint: Endpoints.apiEndpoint,
      apiKey: Endpoints.apiKey,
    );

    setUp(() {
      mockHttpClient = MockHttpClient();
      mostPopularRepository = MostPopularRepoImpl(
        api: api,
        client: mockHttpClient,
      );
    });

    test('Successful GET request can return empty List', () async {
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('[]', 200),
        );
      });
      print('comes here ');
      final mostPopular = await mostPopularRepository.getMostPopular(
        period: Period.week,
      );
      expect(mostPopular, const Right<ApiError, MostPopular?>(null));
    });
    test('Successful GET request can return no article results', () async {
      final body = {
        'status': 'OK',
        'num_results': 0,
        'results': <Article>[],
        'copyright': copyrightText,
      };
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(http.Response(jsonEncode(body), 200));
      });
      final mockReturnedValue =
          await mostPopularRepository.getMostPopular(period: Period.week);
      final expectedValue = MostPopular(
        copyright: copyrightText,
        status: 'OK',
        numResults: 0,
        results: <Article>[],
      );

      expect(mockReturnedValue, isA<Right<ApiError, MostPopular?>>());
      expect(mockReturnedValue, Right<ApiError, MostPopular?>(expectedValue));
    });
    test('Successful GET request should return most viewed articles', () async {
      final articleJson = <String, dynamic>{
        'uri': 'nyt://article/cfedee90-8b4e-5f01-9962-daa8db17512e',
        'url':
            'https://www.nytimes.com/2023/07/09/us/clarence-thomas-horatio-alger-association.html',
        'id': 100000008952422,
        'asset_id': 100000008952422,
        'source': 'New York Times',
        'published_date': '2023-07-09',
        'updated': '2023-07-13 09:51:37',
        'section': 'U.S.',
        'subsection': '',
        'nytdsection': 'u.s.',
        'adx_keywords':
            'Gifts to Public Officials;Ethics and Official Misconduct;High Net Worth Individuals;Awards, Decorations and Honors;Scholarships and Fellowships;Content Type: Personal Profile;audio-neutral-informative;Thomas, Clarence;Sokol, David L;Crow, Harlan;Williams, Armstrong;Supreme Court (US);Horatio Alger Assn',
        'column': null,
        'byline': 'By Abbie VanSickle and Steve Eder',
        'type': 'Article',
        'title':
            'Where Clarence Thomas Entered an Elite Circle and Opened a Door to the Court',
        'abstract':
            'The exclusive Horatio Alger Association brought the justice access to wealthy members and unreported V.I.P. treatment. He, in turn, offered another kind of access.',
        'des_facet': [
          'Gifts to Public Officials',
          'Ethics and Official Misconduct',
          'High Net Worth Individuals',
          'Awards, Decorations and Honors',
          'Scholarships and Fellowships',
          'Content Type: Personal Profile',
          'audio-neutral-informative'
        ],
        'org_facet': ['Supreme Court (US)', 'Horatio Alger Assn'],
        'per_facet': [
          'Thomas, Clarence',
          'Sokol, David L',
          'Crow, Harlan',
          'Williams, Armstrong'
        ],
        'geo_facet': <String>[],
        'media': [
          {
            'type': 'image',
            'subtype': 'photo',
            'caption': '',
            'copyright': '',
            'approved_for_syndication': 0,
            'media-metadata': [
              {
                'url':
                    'https://static01.nyt.com/images/2023/07/08/multimedia/00clarence-horatio-HA4-wtkg/00clarence-horatio-HA4-wtkg-thumbStandard.jpg',
                'format': 'Standard Thumbnail',
                'height': 75,
                'width': 75
              },
              {
                'url':
                    'https://static01.nyt.com/images/2023/07/08/multimedia/00clarence-horatio-HA4-wtkg/00clarence-horatio-HA4-wtkg-mediumThreeByTwo210.jpg',
                'format': 'mediumThreeByTwo210',
                'height': 140,
                'width': 210
              },
              {
                'url':
                    'https://static01.nyt.com/images/2023/07/08/multimedia/00clarence-horatio-HA4-wtkg/00clarence-horatio-HA4-wtkg-mediumThreeByTwo440.jpg',
                'format': 'mediumThreeByTwo440',
                'height': 293,
                'width': 440
              }
            ]
          }
        ],
        'eta_id': 0
      };
      final body = {
        'status': 'OK',
        'num_results': 20,
        'results': List.generate(
          20,
          (index) => articleJson,
        ),
        'copyright': copyrightText,
      };
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(http.Response(jsonEncode(body), 200));
      });
      final mockReturnedValue =
          await mostPopularRepository.getMostPopular(period: Period.week);
      final expectedValue = MostPopular(
        copyright: copyrightText,
        status: 'OK',
        numResults: 20,
        results: List.generate(
          20,
          (index) => Article.fromJson(articleJson),
        ),
      );

      expect(mockReturnedValue, isA<Right<ApiError, MostPopular?>>());
      expect(mockReturnedValue, Right<ApiError, MostPopular?>(expectedValue));
    });
  });
  group('Most Popular Articles query failed GET operations', () {
    late MostPopularRepoImpl mostPopularRepository;
    late MockHttpClient mockHttpClient;

    const api = ApiModel(
      endpoint: Endpoints.apiEndpoint,
      apiKey: Endpoints.apiKey,
    );

    setUp(() {
      mockHttpClient = MockHttpClient();
      mostPopularRepository = MostPopularRepoImpl(
        api: api,
        client: mockHttpClient,
      );
    });

    test('Failed GET request may return 401 - Unauthorized', () async {
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Unauthorized', 401),
        );
      });
      final mostPopular = await mostPopularRepository.getMostPopular(
        period: Period.week,
      );
      expect(
        mostPopular,
        const Left<ApiError, MostPopular?>(
          ApiError(errorType: ApiErrorType.unauthorized, code: 401),
        ),
      );
    });

    test('Failed GET request may return 404 - Not Found', () async {
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Not Found', 404),
        );
      });
      final mostPopular = await mostPopularRepository.getMostPopular(
        period: Period.week,
      );
      expect(
        mostPopular,
        const Left<ApiError, MostPopular?>(
          ApiError(errorType: ApiErrorType.notFound, code: 404),
        ),
      );
    });

    test('Failed GET request may return 429 - Too many request', () async {
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Too many requests', 429),
        );
      });
      final mostPopular = await mostPopularRepository.getMostPopular(
        period: Period.week,
      );
      expect(
        mostPopular,
        const Left<ApiError, MostPopular?>(
          ApiError(errorType: ApiErrorType.tooManyRequests, code: 429),
        ),
      );
    });

    test('Failed GET request may return unknown error', () async {
      when(
        () {
          return mockHttpClient.get(
            Uri.parse(
              '${api.endpoint}/${Period.week.asInt}.json?api-key=${api.apiKey}',
            ),
          );
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Error', 503),
        );
      });
      final mostPopular = await mostPopularRepository.getMostPopular(
        period: Period.week,
      );
      expect(
        mostPopular,
        const Left<ApiError, MostPopular?>(
          ApiError(errorType: ApiErrorType.unknown),
        ),
      );
    });
  });
}

const copyrightText =
    'Copyright (c) 2023 The New York Times Company.  All Rights Reserved.';

enum SuccessfulResponse {
  emptyList,
  emptyResult,
  hasResult,
}
