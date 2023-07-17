import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/period_enum.dart';
import 'package:ui_test_cengizhanparlak/app/service/most_popular_service.dart';

class MockRef extends Mock implements WidgetRef {}

void main() async {
  group('Most popular service FutureProvider tests', () {
    late WidgetRef ref;

    setUp(() {
      ref = MockRef();
    });
    test(
      'getMostPopular may return Most Popular articles',
      () {
        final provider = ref.read(GetMostPopularProvider(period: Period.week));
        print(provider);
      },
    );
  });
}
