import 'dart:convert';

import 'package:ui_test_cengizhanparlak/app/data/enums/result_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/source_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/media_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';

class Article {
  Article({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    required this.byline,
    required this.type,
    required this.title,
    required this.resultAbstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
    this.column,
  });

  factory Article.fromRawJson(String str) =>
      Article.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        uri: json['uri'] as String,
        url: json['url'] as String,
        id: json['id'] as int,
        assetId: json['asset_id'] as int,
        source: sourceValues.map[json['source']]!,
        publishedDate: DateTime.parse(json['published_date'] as String),
        updated: DateTime.parse(json['updated'] as String),
        section: json['section'] as String,
        subsection: json['subsection'] as String,
        nytdsection: json['nytdsection'] as String,
        adxKeywords: json['adx_keywords'] as String,
        column: json['column'],
        byline: json['byline'] as String,
        type: resultTypeValues.map[json['type']]!,
        title: json['title'] as String,
        resultAbstract: json['abstract'] as String,
        desFacet: List<String>.from(
          json['des_facet'].map((dynamic x) => x).toList() as List,
        ),
        orgFacet: List<String>.from(
          json['org_facet'].map((dynamic x) => x).toList() as List,
        ),
        perFacet: List<String>.from(
          json['per_facet'].map((dynamic x) => x).toList() as List,
        ),
        geoFacet: List<String>.from(
          json['geo_facet'].map((dynamic x) => x).toList() as List,
        ),
        media: List<Media>.from(
          json['media']
              .map(
                (dynamic x) => Media.fromJson(x as Map<String, dynamic>),
              )
              .toList() as List,
        ),
        etaId: json['eta_id'] as int,
      );
  final String uri;
  final String url;
  final int id;
  final int assetId;
  final Source source;
  final DateTime publishedDate;
  final DateTime updated;
  final String section;
  final String subsection;
  final String nytdsection;
  final String adxKeywords;
  final dynamic column;
  final String byline;
  final ResultType type;
  final String title;
  final String resultAbstract;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Media> media;
  final int etaId;

  Article copyWith({
    String? uri,
    String? url,
    int? id,
    int? assetId,
    Source? source,
    DateTime? publishedDate,
    DateTime? updated,
    String? section,
    String? subsection,
    String? nytdsection,
    String? adxKeywords,
    dynamic column,
    String? byline,
    ResultType? type,
    String? title,
    String? resultAbstract,
    List<String>? desFacet,
    List<String>? orgFacet,
    List<String>? perFacet,
    List<String>? geoFacet,
    List<Media>? media,
    int? etaId,
  }) =>
      Article(
        uri: uri ?? this.uri,
        url: url ?? this.url,
        id: id ?? this.id,
        assetId: assetId ?? this.assetId,
        source: source ?? this.source,
        publishedDate: publishedDate ?? this.publishedDate,
        updated: updated ?? this.updated,
        section: section ?? this.section,
        subsection: subsection ?? this.subsection,
        nytdsection: nytdsection ?? this.nytdsection,
        adxKeywords: adxKeywords ?? this.adxKeywords,
        column: column ?? this.column,
        byline: byline ?? this.byline,
        type: type ?? this.type,
        title: title ?? this.title,
        resultAbstract: resultAbstract ?? this.resultAbstract,
        desFacet: desFacet ?? this.desFacet,
        orgFacet: orgFacet ?? this.orgFacet,
        perFacet: perFacet ?? this.perFacet,
        geoFacet: geoFacet ?? this.geoFacet,
        media: media ?? this.media,
        etaId: etaId ?? this.etaId,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'uri': uri,
        'url': url,
        'id': id,
        'asset_id': assetId,
        'source': sourceValues.reverse[source],
        'published_date':
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        'updated': updated.toIso8601String(),
        'section': section,
        'subsection': subsection,
        'nytdsection': nytdsection,
        'adx_keywords': adxKeywords,
        'column': column,
        'byline': byline,
        'type': resultTypeValues.reverse[type],
        'title': title,
        'abstract': resultAbstract,
        'des_facet': List<dynamic>.from(desFacet.map((x) => x)),
        'org_facet': List<dynamic>.from(orgFacet.map((x) => x)),
        'per_facet': List<dynamic>.from(perFacet.map((x) => x)),
        'geo_facet': List<dynamic>.from(geoFacet.map((x) => x)),
        'media': List<dynamic>.from(media.map((x) => x.toJson())),
        'eta_id': etaId,
      };

  bool get hasImage => media.firstOrNull?.mediaMetadata.firstOrNull != null;
}
