import 'dart:ui' show PlatformDispatcher;

import 'package:curriculum_dart/service/locale.service.dart';

class PlatformLocaleService implements LocaleService {
  static PlatformLocaleService? _instancia;

  PlatformLocaleService._();

  static PlatformLocaleService get instance {
    _instancia ??= PlatformLocaleService._();
    return _instancia!;
  }

  @override
  String getDeviceLanguageCode() {
    // Acessa a localidade do dispositivo usando dart:ui
    return PlatformDispatcher.instance.locale.languageCode;
  }
}
