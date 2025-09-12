import 'package:curriculum_dart/repo/curriculum_repo.dart';
import 'package:curriculum_dart/service/audio.service.dart';
import 'package:curriculum_dart/service/contact.service.dart';
import 'package:curriculum_dart/service/pdf.service.dart';
import 'package:curriculum_dart/service/theme.service.dart';
import 'package:curriculum_flutter/infrastructure/repo/local_curriculum_repo.dart';
import 'package:curriculum_flutter/infrastructure/service/flutter_audio.service.dart';
import 'package:curriculum_flutter/infrastructure/service/flutter_contact.service.dart';
import 'package:curriculum_flutter/infrastructure/service/flutter_pdf.service.dart';
import 'package:curriculum_flutter/infrastructure/service/flutter_theme.service.dart';

abstract class AppModule {
  static PdfService get pdfService => FlutterPdfService.instance;

  static ContactService get contactService => FlutterContactService.instance;

  static CurriculumRepo get curriculumRepo => LocalCurriculumRepo.instance;

  static ThemeService get themeService => FlutterThemeService.instance;

  static AudioService get audioService => FlutterAudioService.instance;
}
