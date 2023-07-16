import 'package:easy_localization/easy_localization.dart' as ez;

extension I18NExtension on String {
  String get translate => ez.tr(this);
}
