import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_test_cengizhanparlak/app/constant/values/colors.dart';

enum ThemeOption { light, dark }

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  return ThemeController(ThemeOption.light);
});

class ThemeController extends ChangeNotifier {
  ThemeController(this._themeOption) {
    theme = _themeOption == ThemeOption.light ? lightTheme : darkTheme;
  }

  final ThemeOption _themeOption;

  late ThemeData theme;

  bool get isDark => theme == darkTheme;

  void changeTheme() {
    theme = isDark ? lightTheme : darkTheme;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.greenMain,
      primaryColorDark: AppColors.greenMainDark,
      splashColor: AppColors.greenMain,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarGreen,
        foregroundColor: AppColors.white,
        elevation: 5,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        displayLarge: robotoFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: robotoFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        displaySmall: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.darkGray,
        ),
        headlineMedium: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.darkGray,
        ),
        headlineSmall: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodySmall: soraFont.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.darkGray,
        ),
        titleSmall: soraFont.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGray,
        ),
        titleMedium: soraFont.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.gray,
        ),
        labelSmall: soraFont.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.gray,
        thickness: 1,
        indent: 16,
        endIndent: 16,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
        onSecondary: AppColors.darkGray,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.darkGray,
        hintStyle: soraFont.copyWith(
          fontSize: 16,
          color: AppColors.darkGray,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.greenMain,
      primaryColorDark: AppColors.greenMainLight,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: TextTheme(
        displayLarge: robotoFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: robotoFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        displaySmall: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        headlineMedium: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        headlineSmall: soraFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodySmall: soraFont.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        titleSmall: soraFont.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        titleMedium: soraFont.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        labelSmall: soraFont.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGray,
        thickness: 1,
        indent: 16,
        endIndent: 16,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        secondary: Colors.white,
        onSecondary: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.gray,
        hintStyle: soraFont.copyWith(
          fontSize: 16,
          color: AppColors.gray,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

final soraFont = GoogleFonts.sora();
final robotoFont = GoogleFonts.roboto();
