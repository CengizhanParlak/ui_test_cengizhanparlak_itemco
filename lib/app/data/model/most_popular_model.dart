// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:ui_test_cengizhanparlak/app/data/enums/format_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/media_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/result_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/source_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/subtype_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/article_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/enum_values_model.dart';

class MostPopular {
  MostPopular({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  factory MostPopular.fromRawJson(String str) =>
      MostPopular.fromJson(json.decode(str) as Map<String, dynamic>);

  factory MostPopular.fromJson(Map<String, dynamic> json) => MostPopular(
        status: json['status'] as String,
        copyright: json['copyright'] as String,
        numResults: json['num_results'] as int,
        results: List<Article>.from(
          (json['results'] as List<dynamic>)
              .map((x) => Article.fromJson(x as Map<String, dynamic>)),
        ),
      );
  final String status;
  final String copyright;
  final int numResults;
  final List<Article> results;

  MostPopular copyWith({
    String? status,
    String? copyright,
    int? numResults,
    List<Article>? results,
  }) =>
      MostPopular(
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        numResults: numResults ?? this.numResults,
        results: results ?? this.results,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'status': status,
        'copyright': copyright,
        'num_results': numResults,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

final formatValues = EnumValues({
  'mediumThreeByTwo210': Format.MEDIUM_THREE_BY_TWO210,
  'mediumThreeByTwo440': Format.MEDIUM_THREE_BY_TWO440,
  'Standard Thumbnail': Format.STANDARD_THUMBNAIL
});

final subtypeValues = EnumValues({'': Subtype.EMPTY, 'photo': Subtype.PHOTO});

final mediaTypeValues = EnumValues({'image': MediaType.IMAGE});

final sourceValues = EnumValues({'New York Times': Source.NEW_YORK_TIMES});

final resultTypeValues = EnumValues(
  {'Article': ResultType.ARTICLE, 'Interactive': ResultType.INTERACTIVE},
);
