import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/api_error_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/api_error_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';
import 'package:ui_test_cengizhanparlak/app/screens/home/components/home_screen_article_listview.dart';
import 'package:ui_test_cengizhanparlak/app/widgets/app_error_text.dart';

class MostPopularMock extends Mock implements MostPopular {}

final provider =
    FutureProvider.family<Either<ApiError, MostPopularMock?>, bool>(
        (ref, isError) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  if (isError) {
    return const Left(ApiError(errorType: ApiErrorType.unauthorized));
  } else {
    return Right(MostPopularMock());
  }
});

void main() {
  testWidgets(
      'If Most Popular articles fetched, Articles ListView must be shown',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Consumer(
            builder: (context, ref, _) {
              final myDataAsyncValue = ref.watch(provider(false));
              return myDataAsyncValue.when(
                data: (data) {
                  if (data.isLeft) {
                    return ErrorText(
                      text: data.left.errorType.message,
                      refresh: () {
                        return ref.refresh(provider(false));
                      },
                    );
                  } else {
                    return const ArticlesListView();
                  }
                },
                loading: CircularProgressIndicator.new,
                error: (error, stackTrace) => ErrorText(
                  text: error.toString(),
                  refresh: () {
                    return ref.refresh(provider(false));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(ArticlesListView), findsOneWidget);
  });

  testWidgets(
      'If Most Popular articles NOT fetched, error button must be shown',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Consumer(
            builder: (context, ref, _) {
              final myDataAsyncValue = ref.watch(provider(true));
              return myDataAsyncValue.when(
                data: (data) {
                  if (data.isLeft) {
                    return ErrorText(
                      text: data.left.errorType.message,
                      refresh: () {
                        return ref.refresh(provider(false));
                      },
                    );
                  } else {
                    return const ArticlesListView();
                  }
                },
                loading: CircularProgressIndicator.new,
                error: (error, stackTrace) => ErrorText(
                  text: error.toString(),
                  refresh: () {
                    return ref.refresh(provider(false));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(ErrorText), findsOneWidget);
  });

  // testWidgets(
  //     'Pressing error button must refresh the page and show Articles ListView',
  //     (WidgetTester tester) async {
  //   bool isFail = true;
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       child: MaterialApp(
  //         home: Consumer(
  //           builder: (context, ref, _) {
  //             print('inside builder');
  //             print('isFail: $isFail');
  //             final myDataAsyncValue = ref.watch(provider(isFail));
  //             return myDataAsyncValue.when(
  //               data: (data) {
  //                 print('inside data');
  //                 if (data.isLeft) {
  //                   print('inside isLeft');
  //                   return ErrorText(
  //                     text: data.left.errorType.message,
  //                     refresh: () {
  //                       isFail = false;
  //                       return ref.refresh(provider(false));
  //                     },
  //                   );
  //                 } else {
  //                   print('inside else');
  //                   return const ArticlesListView();
  //                 }
  //               },
  //               loading: CircularProgressIndicator.new,
  //               error: (error, stackTrace) {
  //                 print('inside error');
  //                 return ErrorText(
  //                   text: error.toString(),
  //                   refresh: () {
  //                     isFail = false;
  //                     return ref.refresh(provider(isFail));
  //                   },
  //                 );
  //               },
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);

  //   await tester.pumpAndSettle(const Duration(seconds: 10));

  //   expect(find.byType(ErrorText), findsOneWidget);

  //   final buttonFinder = find.byType(ElevatedButton);

  //   expect(buttonFinder, findsOneWidget);

  //   await tester.tap(buttonFinder);

  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);

  //   await tester.pumpAndSettle(const Duration(seconds: 10));
  // });
}
