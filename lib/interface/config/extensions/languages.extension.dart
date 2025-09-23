import 'package:curriculum_dart/domain/enums/languages.enum.dart';
import 'package:curriculum_flutter/generated/assets.dart' show Assets;

extension LanguageExtension on Languages {
  static Languages getByString(String idioma) {
    switch (idioma) {
      case 'pt_BR':
        return Languages.portuguese;
      case 'en_US':
        return Languages.english;
      default:
        return Languages.english;
    }
  }

  List<String> get splitCode {
    switch (this) {
      case Languages.portuguese:
        return ['pt', 'BR'];
      case Languages.english:
        return ['en', 'US'];
    }
  }

  String get flag {
    switch (this) {
      case Languages.portuguese:
        return Assets.languagesBrazil;
      case Languages.english:
        return Assets.languagesUsa;
    }
  }

  String get oppositeFlag {
    switch (this) {
      case Languages.portuguese:
        return Assets.languagesUsa;
      case Languages.english:
        return Assets.languagesBrazil;
    }
  }
}
