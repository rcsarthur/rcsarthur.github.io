import 'package:curriculum_dart/domain/entities/theme_settings.dart';
import 'package:curriculum_dart/domain/enums/app_theme.enum.dart';
import 'package:curriculum_dart/domain/enums/languages.enum.dart';
import 'package:curriculum_dart/service/locale.service.dart';
import 'package:curriculum_dart/service/notification.service.dart';
import 'package:curriculum_dart/state/theme_state.dart';
import 'package:curriculum_dart/use_case/audio.use_case.dart';
import 'package:curriculum_dart/use_case/theme.use_case.dart';
import 'package:curriculum_flutter/generated/l10n.dart';
import 'package:curriculum_flutter/interface/config/extensions/languages.extension.dart';
import 'package:curriculum_flutter/interface/view_model/execution/execution.view_model.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier with ExecutionViewModel {
  final ThemeUseCase _themeUseCase;
  final AudioUseCase _audioUseCase;
  final NotificationService _notificationService;
  final LocaleService _localeService;

  late ThemeState _state;

  @override
  NotificationService get notificationService => _notificationService;

  ThemeState get state => _state;

  ThemeViewModel({
    required ThemeUseCase themeUseCase,
    required AudioUseCase audioUseCase,
    required NotificationService notificationService,
    required LocaleService localeService,
  })  : _themeUseCase = themeUseCase,
        _audioUseCase = audioUseCase,
        _notificationService = notificationService,
        _localeService = localeService {
    _state = ThemeState(
      themeSettings: ThemeSettings(
        themeMode: AppThemeMode.dark,
        language: Languages.fromDeviceLocale(_localeService),
      ),
      isLoading: false,
    );
  }

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
    ThemeState? newState;
    newState = await executeWithNotification(
      () async => await _themeUseCase.get(),
      errorMessage: S.current.notificationErrorLoadTheme,
    );
    if (newState == null) return;
    _updateState(newState);
  }

  Future<void> toggleTheme() async {
    final currentTheme = _state.themeSettings.themeMode;
    final newTheme = currentTheme == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light;
    final newThemeSettings = _state.themeSettings.copyWith(themeMode: newTheme);
    await executeWithNotification(
      () async => await _themeUseCase.update(newThemeSettings),
      successMessage: S.current.notificationSuccessToggleTheme(newTheme.name),
      errorMessage: S.current.notificationErrorToggleTheme,
    );
    _updateState(_state.copyWith(themeSettings: newThemeSettings));
  }

  Future<void> toggleLanguage() async {
    final currentLanguage = _state.themeSettings.language;
    final language = currentLanguage.opposite;
    final newThemeSettings = _state.themeSettings.copyWith(language: language);
    await executeWithNotification(
      () async {
        await _themeUseCase.update(newThemeSettings);
        S.load(currentLocale);
      },
      successMessage: S.current.notificationSuccessToggleLanguage(newThemeSettings.language.code),
      errorMessage: S.current.notificationErrorToggleLanguage,
    );
    _updateState(_state.copyWith(themeSettings: newThemeSettings));
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
