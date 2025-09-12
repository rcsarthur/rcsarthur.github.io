import 'dart:ui' as ui;

import 'package:curriculum_dart/domain/entities/languages.dart';
import 'package:curriculum_dart/domain/entities/theme_settings.dart';
import 'package:curriculum_dart/service/theme.service.dart';

class FlutterThemeService implements ThemeService {
  static FlutterThemeService? _instancia;

  FlutterThemeService._();

  static FlutterThemeService get instance {
    _instancia ??= FlutterThemeService._();
    return _instancia!;
  }

  @override
  Future<ThemeSettings> getThemeSettings() async {
    return ThemeSettings(
      themeMode: AppThemeMode.dark,
      language: _getSystemDefaultLanguage,
    );
  }

  @override
  Future<void> updateThemeSettings(ThemeSettings themeSettings) async {
    // await Future.delayed(const Duration(milliseconds: 300));
  }

  Languages get _getSystemDefaultLanguage =>
      Languages.values.firstWhere((lang) => lang.code.contains(ui.PlatformDispatcher.instance.locale.languageCode));
}
