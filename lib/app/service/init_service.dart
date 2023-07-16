import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
}
