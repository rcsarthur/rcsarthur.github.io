import 'dart:ui';

import 'package:curriculum_dart/domain/entities/languages.dart';
import 'package:curriculum_dart/domain/entities/theme_settings.dart';
import 'package:curriculum_dart/state/theme_state.dart';
import 'package:curriculum_dart/use_case/audio.use_case.dart';
import 'package:curriculum_dart/use_case/theme.use_case.dart';
import 'package:curriculum_flutter/generated/l10n.dart';
import 'package:curriculum_flutter/interface/config/extensions/languages.extension.dart';
import 'package:flutter/foundation.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeUseCase _themeUseCase;
  final AudioUseCase _audioUseCase;

  ThemeState _state = ThemeState(
    themeSettings: ThemeSettings(
      themeMode: AppThemeMode.dark,
      language: Languages.fromDeviceLocale,
    ),
    isLoading: false,
  );

  ThemeState get state => _state;

  ThemeViewModel({
    required ThemeUseCase themeUseCase,
    required AudioUseCase audioUseCase,
  })  : _themeUseCase = themeUseCase,
        _audioUseCase = audioUseCase;

  Future<void> playAudio(String asset) async {
    try {
      await _audioUseCase.play(asset);
    } catch (e) {
      rethrow;
    }
  }

  void _updateState(ThemeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadTheme() async {
    _updateState(_state.setLoading(true));
    try {
      final newState = await _themeUseCase.get();
      _updateState(newState);
    } catch (e) {
      _updateState(_state.setError('Erro ao carregar dados do currículo: $e'));
    }
  }

  Future<void> toggleTheme() async {
    final currentTheme = _state.themeSettings.themeMode;
    final newTheme = currentTheme == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light;
    final newThemeSettings = _state.themeSettings.copyWith(themeMode: newTheme);
    try {
      await _themeUseCase.update(newThemeSettings);
      _updateState(_state.copyWith(themeSettings: newThemeSettings));
    } catch (e) {
      _updateState(_state.setError('Erro ao alterar tema: $e'));
    }
  }

  Future<void> changeLanguage(Languages language) async {
    final newThemeSettings = _state.themeSettings.copyWith(language: language);
    try {
      _updateState(_state.copyWith(themeSettings: newThemeSettings));
      S.load(currentLocale);
    } catch (e) {
      _updateState(_state.setError('Erro ao alterar idioma: $e'));
    }
  }

  void clearError() {
    _updateState(_state.clearError());
  }

  ThemeSettings get themeSettings => _state.themeSettings;

  bool get executing => _state.isLoading;

  String? get error => _state.error;

  bool get isDarkMode => _state.themeSettings.themeMode == AppThemeMode.dark;

  Locale get currentLocale =>
      Locale(_state.themeSettings.language.splitCode.first, _state.themeSettings.language.splitCode.last);
}
