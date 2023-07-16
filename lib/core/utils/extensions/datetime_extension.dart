import 'package:easy_localization/easy_localization.dart';
import 'package:ui_test_cengizhanparlak/app/service/language_service.dart';

extension DateTimeExtension on DateTime {
  String get toFormattedString =>
      DateFormat.yMMMMd(LanguageService.appLocale.toLanguageTag()).format(this);
}
