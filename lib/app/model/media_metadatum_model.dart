import 'dart:convert';

import 'package:ui_test_cengizhanparlak/app/model/most_popular_model.dart';

import 'package:ui_test_cengizhanparlak/app/constant/enums/format_enum.dart';

class MediaMetadatum {
  MediaMetadatum({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetadatum.fromRawJson(String str) =>
      MediaMetadatum.fromJson(json.decode(str) as Map<String, dynamic>);

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json['url'] as String,
        format: formatValues.map[json['format']]!,
        height: json['height'] as int,
        width: json['width'] as int,
      );
  final String url;
  final Format format;
  final int height;
  final int width;

  MediaMetadatum copyWith({
    String? url,
    Format? format,
    int? height,
    int? width,
  }) =>
      MediaMetadatum(
        url: url ?? this.url,
        format: format ?? this.format,
        height: height ?? this.height,
        width: width ?? this.width,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'url': url,
        'format': formatValues.reverse[format],
        'height': height,
        'width': width,
      };
}
