import 'package:curriculum_flutter/theme/app_palette.dart';
import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.colors});

  final Map<String, Color> colors;

  Color get scaffoldBackground => colors['scaffoldBackground']!;

  Color get defaultText => colors['defaultText']!;

  Color get lightText => colors['lightText']!;

  Color get darkText => colors['darkText']!;

  Color get lightCard => colors['lightCard']!;

  Color get cardBackground => colors['cardBackground']!;

  Color get greyBackground => colors['greyBackground']!;

  Color get accentInstall => colors['accentInstall']!;

  Color get accentUninstall => colors['accentUninstall']!;

  Color get accentOpen => colors['accentOpen']!;

  Color get accentUpdate => colors['accentUpdate']!;

  @override
  AppColors copyWith({Map<String, Color>? colors}) {
    return AppColors(colors: colors ?? this.colors);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      colors: Map.fromEntries(
        colors.entries.map((entry) {
          final otherColor = other.colors[entry.key];
          return MapEntry(entry.key, Color.lerp(entry.value, otherColor, t)!);
        }),
      ),
    );
  }

  static AppColors get light => const AppColors(
        colors: {
          'scaffoldBackground': AppPalette.lightScaffold,
          'defaultText': AppPalette.darkText,
          'lightText': AppPalette.lightText,
          'darkText': AppPalette.darkText,
          'lightCard': AppPalette.lightCard,
          'cardBackground': AppPalette.lightCard,
          'greyBackground': AppPalette.greyBackground,
        },
      );

  static AppColors get dark => const AppColors(
        colors: {
          'scaffoldBackground': AppPalette.darkScaffold,
          'defaultText': AppPalette.lightText,
          'lightText': AppPalette.lightText,
          'darkText': AppPalette.darkText,
          'lightCard': AppPalette.lightCard,
          'cardBackground': AppPalette.darkCard,
          'greyBackground': AppPalette.greyBackground,
        },
      );

  Color calculateSolidColor(Color transparentColor, Color backgroundColor) {
    final double alpha = transparentColor.a;
    final double oneMinusAlpha = 1.0 - alpha;
    final newRed = ((transparentColor.r * alpha) + (backgroundColor.r * oneMinusAlpha));
    final newGreen = ((transparentColor.g * alpha) + (backgroundColor.g * oneMinusAlpha));
    final newBlue = ((transparentColor.b * alpha) + (backgroundColor.b * oneMinusAlpha));
    return Color.from(alpha: 1, red: newRed, green: newGreen, blue: newBlue);
  }
}
