import 'dart:convert';

import 'package:ui_test_cengizhanparlak/app/data/enums/media_type_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/subtype_enum.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/media_metadatum_model.dart';
import 'package:ui_test_cengizhanparlak/app/data/model/most_popular_model.dart';

class Media {
  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  factory Media.fromRawJson(String str) =>
      Media.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: mediaTypeValues.map[json['type']]!,
        subtype: subtypeValues.map[json['subtype']]!,
        caption: json['caption'] as String,
        copyright: json['copyright'] as String,
        approvedForSyndication: json['approved_for_syndication'] as int,
        mediaMetadata: List<MediaMetadatum>.from(
          json['media-metadata']
              .map(
                (dynamic x) =>
                    MediaMetadatum.fromJson(x as Map<String, dynamic>),
              )
              .toList() as List,
        ),
      );
  final MediaType type;
  final Subtype subtype;
  final String caption;
  final String copyright;
  final int approvedForSyndication;
  final List<MediaMetadatum> mediaMetadata;

  Media copyWith({
    MediaType? type,
    Subtype? subtype,
    String? caption,
    String? copyright,
    int? approvedForSyndication,
    List<MediaMetadatum>? mediaMetadata,
  }) =>
      Media(
        type: type ?? this.type,
        subtype: subtype ?? this.subtype,
        caption: caption ?? this.caption,
        copyright: copyright ?? this.copyright,
        approvedForSyndication:
            approvedForSyndication ?? this.approvedForSyndication,
        mediaMetadata: mediaMetadata ?? this.mediaMetadata,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'type': mediaTypeValues.reverse[type],
        'subtype': subtypeValues.reverse[subtype],
        'caption': caption,
        'copyright': copyright,
        'approved_for_syndication': approvedForSyndication,
        'media-metadata':
            List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
      };
}
