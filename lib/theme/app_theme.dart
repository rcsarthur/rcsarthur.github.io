import 'package:curriculum_dart/domain/enums/app_theme.enum.dart';
import 'package:curriculum_flutter/theme/app_colors.dart';
import 'package:curriculum_flutter/theme/app_palette.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2563EB);

  static bool _mobile(BuildContext context) {
    if (kIsWeb) {
      return false;
    } else {
      final TargetPlatform platform = Theme.of(context).platform;
      return platform == TargetPlatform.android || platform == TargetPlatform.iOS;
    }
  }

  // Light Theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      hoverColor: _mobile(context) ? Colors.transparent : null,
      splashColor: _mobile(context) ? Colors.transparent : null,
      highlightColor: _mobile(context) ? Colors.transparent : null,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppPalette.lightScaffold,
        brightness: Brightness.light,
        outline: const Color(0x10000000),
      ),
      scaffoldBackgroundColor: AppPalette.lightScaffold,
      cardColor: AppPalette.lightCard,
      extensions: <ThemeExtension<AppColors>>[AppColors.light],
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: AppPalette.darkText,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppPalette.lightCard,
        dismissDirection: DismissDirection.horizontal,
        contentTextStyle: const TextStyle(
          color: AppPalette.darkText,
        ),
      ),
      cardTheme: Theme.of(context).cardTheme.copyWith(
            color: AppPalette.lightCard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.black.withValues(alpha: 0.1),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppPalette.lightCard,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppPalette.lightCard,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppPalette.lightCard,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          color: AppColors.light.defaultText,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.25,
          color: AppColors.light.defaultText,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.light.defaultText,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.light.defaultText,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.light.defaultText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: AppColors.light.calculateSolidColor(
              AppColors.light.defaultText.withValues(alpha: .7), AppColors.light.scaffoldBackground),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          color: AppColors.light.calculateSolidColor(
              AppColors.light.defaultText.withValues(alpha: .7), AppColors.light.scaffoldBackground),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.3,
          color: AppColors.light.calculateSolidColor(
              AppColors.light.defaultText.withValues(alpha: .6), AppColors.light.scaffoldBackground),
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      hoverColor: _mobile(context) ? Colors.transparent : null,
      splashColor: _mobile(context) ? Colors.transparent : null,
      highlightColor: _mobile(context) ? Colors.transparent : null,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppPalette.darkScaffold,
        brightness: Brightness.dark,
        outline: const Color(0x10000000),
      ),
      scaffoldBackgroundColor: AppPalette.darkScaffold,
      cardColor: AppPalette.darkCard,
      extensions: <ThemeExtension<AppColors>>[AppColors.dark],
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppPalette.darkScaffold,
        foregroundColor: AppPalette.lightText,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppPalette.darkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        dismissDirection: DismissDirection.horizontal,
        contentTextStyle: const TextStyle(
          color: AppPalette.lightText,
        ),
      ),
      cardTheme: Theme.of(context).cardTheme.copyWith(
            color: AppPalette.darkCard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.black.withValues(alpha: 0.1),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppPalette.darkCard,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppPalette.darkCard,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppPalette.darkCard,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          color: AppColors.dark.defaultText,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.25,
          color: AppColors.dark.defaultText,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.dark.defaultText,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.dark.defaultText,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.dark.defaultText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: AppColors.dark
              .calculateSolidColor(AppColors.dark.defaultText.withValues(alpha: .7), AppColors.dark.scaffoldBackground),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          color: AppColors.dark
              .calculateSolidColor(AppColors.dark.defaultText.withValues(alpha: .7), AppColors.dark.scaffoldBackground),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.3,
          color: AppColors.dark
              .calculateSolidColor(AppColors.dark.defaultText.withValues(alpha: .6), AppColors.dark.scaffoldBackground),
        ),
      ),
    );
  }

  static const Map<String, Color> _lightCustomColors = {
    'flutter': Color(0xFF0175C2),
    'dart': Color(0xFF00589B),
    'java': Color(0xFFE57001),
    'quarkus': Color(0xFF3B5B9A),
    'sqlite': Color(0xFF003B57),
    'mysql': Color(0xFF4479A1),
    'rest apis': Color(0xFFD65A00),
    'mobx': Color(0xFFE57001),
    'i18n': Color(0xFF3B5B9A),
    'full-stack': Color(0xFF0175C2),
    'github': Color(0xFF181717),
    'linkedin': Color(0xFF0A66C2),
    'whatsapp': Color(0xFF25D366),
    'email': Color(0xFF34495E),
  };

  static const Map<String, Color> _darkCustomColors = {
    'flutter': Color(0xFF4FC3F7),
    'dart': Color(0xFF29B6F6),
    'java': Color(0xFFDDB74D),
    'quarkus': Color(0xFF7986CB),
    'sqlite': Color(0xFF4DB6AC),
    'mysql': Color(0xFF80CBC4),
    'rest apis': Color(0xFFFF8A65),
    'mobx': Color(0xFFFFB74D),
    'i18n': Color(0xFF7986CB),
    'full-stack': Color(0xFF4FC3F7),
    'github': Color(0xFF282727),
    'linkedin': Color(0xFF0A66C2),
    'whatsapp': Color(0xFF25D366),
    'email': Color(0xFF34495E),
  };

  static Color getCustomColor(String key, AppThemeMode themeMode) {
    return themeMode == AppThemeMode.light
        ? _lightCustomColors[key.toLowerCase()] ?? primaryColor
        : _darkCustomColors[key.toLowerCase()] ?? primaryColor;
  }
}
