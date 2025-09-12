import 'dart:ui';

import 'package:curriculum_dart/domain/entities/theme_settings.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/module/app_router.dart';
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  if (kIsWeb) setUrlStrategy(const HashUrlStrategy());
  runApp(CurriculumApp());
}

class CurriculumApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final _viewModelNotifier = ViewModelNotifier();

  CurriculumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      notifier: _viewModelNotifier,
      child: Builder(
        builder: (context) {
          final curriculumViewModel = context.curriculumViewModel;
          final themeViewModel = context.themeViewModel;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (curriculumViewModel.personalInfo == null && !curriculumViewModel.executing) {
              curriculumViewModel.loadCurriculumData();
            }
          });

          return MaterialApp.router(
            title: 'Arthur R C Santos - Curriculum Vitae',
            debugShowCheckedModeBanner: false,
            // Theme configuration
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode: _getThemeMode(themeViewModel.themeSettings.themeMode),
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus,
                PointerDeviceKind.invertedStylus,
              },
              scrollbars: false,
              physics: const BouncingScrollPhysics(),
            ),
            // Localization configuration
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: themeViewModel.currentLocale,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            // Router configuration
            routerConfig: _appRouter.config(),

            // Responsive framework configuration
            builder: (context, child) {
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
