import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/api_error_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/repository/article_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('Article query successful GET operations', () {
    late ArticleRepositoryImpl articleRepository;
    late MockHttpClient mockHttpClient;
    const articleURL =
        'https://www.nytimes.com/2023/07/09/us/clarence-thomas-horatio-alger-association.html';

    setUp(() {
      mockHttpClient = MockHttpClient();
      articleRepository = ArticleRepositoryImpl(client: mockHttpClient);
    });

    test('Successful GET request can return empty result', () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('', 200),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(response, const Right<ApiError, String?>(null));
    });
    test('Successful GET request can return HTML response of the article',
        () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response(
            '''
<!DOCTYPE html>
<html lang="en" class=" story nytapp-vi-article"  xmlns:og="http://opengraphprotocol.org/schema/>
  <head>
  ''',
            200,
          ),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(response, isA<Right<ApiError, String?>>());
      expect(
        response.isRight && (response.right?.contains('DOCTYPE') ?? false),
        (const Right<ApiError, String?>('<!DOCTYPE html>')).isRight &&
            ((const Right<ApiError, String?>('<!DOCTYPE html>'))
                    .right
                    ?.contains('DOCTYPE') ??
                false),
      );
    });
  });
  group('Article query failed GET operations', () {
    late ArticleRepositoryImpl articleRepository;
    late MockHttpClient mockHttpClient;
    const articleURL =
        'https://www.nytimes.com/2023/07/09/us/clarence-thomas-horatio-alger-association.html';

    setUp(() {
      mockHttpClient = MockHttpClient();
      articleRepository = ArticleRepositoryImpl(client: mockHttpClient);
    });

    test('Failed GET request may return 401 - Unauthorized', () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Unauthorized', 401),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(
        response,
        const Left<ApiError, String?>(
          ApiError(
            errorType: ApiErrorType.unauthorized,
            code: 401,
          ),
        ),
      );
    });

    test('Failed GET request may return 404 - Not Found', () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Unauthorized', 404),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(
        response,
        const Left<ApiError, String?>(
          ApiError(
            errorType: ApiErrorType.notFound,
            code: 404,
          ),
        ),
      );
    });

    test('Failed GET request may return 429 - Too many request', () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Unauthorized', 429),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(
        response,
        const Left<ApiError, String?>(
          ApiError(errorType: ApiErrorType.tooManyRequests, code: 429),
        ),
      );
    });

    test('Failed GET request may return unknown error', () async {
      when(
        () {
          return mockHttpClient.get(Uri.parse(articleURL));
        },
      ).thenAnswer((invocation) {
        return Future.value(
          http.Response('Internal Server Error', 500),
        );
      });
      final response = await articleRepository.getArticle(articleURL);
      expect(
        response,
        const Left<ApiError, String?>(
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
