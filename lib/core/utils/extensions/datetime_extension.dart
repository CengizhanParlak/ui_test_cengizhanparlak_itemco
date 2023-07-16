import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get toFormattedString => DateFormat.yMMMMd().format(this);
}
