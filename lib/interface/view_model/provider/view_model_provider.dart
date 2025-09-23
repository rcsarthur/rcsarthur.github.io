import 'package:curriculum_dart/use_case/audio.use_case.dart';
import 'package:curriculum_dart/use_case/curriculum.use_case.dart';
import 'package:curriculum_dart/use_case/launch.use_case.dart';
import 'package:curriculum_dart/use_case/pdf.use_case.dart';
import 'package:curriculum_dart/use_case/theme.use_case.dart';
import 'package:curriculum_flutter/interface/config/module/app.module.dart';
import 'package:curriculum_flutter/interface/view_model/curriculum.view_model.dart';
import 'package:curriculum_flutter/interface/view_model/theme.view_model.dart';
import 'package:flutter/material.dart';

class ViewModelProvider extends InheritedNotifier<ViewModelNotifier> {
  const ViewModelProvider({
    super.key,
    required ViewModelNotifier super.notifier,
    required super.child,
  });

  static ViewModelProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModelProvider>();
  }
}

class ViewModelNotifier extends ChangeNotifier {
  CurriculumViewModel? _curriculumViewModel;
  ThemeViewModel? _themeViewModel;

  CurriculumViewModel get curriculumViewModel {
    _curriculumViewModel ??= _createCurriculumViewModel();
    return _curriculumViewModel!;
  }

  ThemeViewModel get themeViewModel {
    _themeViewModel ??= _createThemeViewModel();
    return _themeViewModel!;
  }

  CurriculumViewModel _createCurriculumViewModel() {
    final curriculumDataUseCase = CurriculumUseCase(AppModule.curriculumRepo);
    final pdfUseCase = PdfUseCase(AppModule.pdfService);
    final launchUseCase = LaunchUseCase(AppModule.launchService);

    final viewModel = CurriculumViewModel(
      getCurriculumDataUseCase: curriculumDataUseCase,
      generatePdfUseCase: pdfUseCase,
      launchUseCase: launchUseCase,
      notificationService: AppModule.notificationService,
    );

    viewModel.addListener(() => notifyListeners());
    return viewModel;
  }

  ThemeViewModel _createThemeViewModel() {
    final themeUseCase = ThemeUseCase(AppModule.themeService);
    final audioUseCase = AudioUseCase(AppModule.audioService);
    final viewModel = ThemeViewModel(
      themeUseCase: themeUseCase,
      audioUseCase: audioUseCase,
      notificationService: AppModule.notificationService,
      localeService: AppModule.localeService,
    );

    viewModel.addListener(() => notifyListeners());
    return viewModel;
  }

  @override
  void dispose() {
    _curriculumViewModel?.dispose();
    _themeViewModel?.dispose();
    super.dispose();
  }
}

extension ViewModelContext on BuildContext {
  CurriculumViewModel get curriculumViewModel {
    final provider = ViewModelProvider.of(this);
    if (provider == null) {
      throw FlutterError(
        'ViewModelProvider não encontrado na árvore de widgets.\n'
        'Certifique-se de que o widget está envolvido por ViewModelProvider.',
      );
    }
    return provider.notifier!.curriculumViewModel;
  }

  ThemeViewModel get themeViewModel {
    final provider = ViewModelProvider.of(this);
    if (provider == null) {
      throw FlutterError(
        'ViewModelProvider não encontrado na árvore de widgets.\n'
        'Certifique-se de que o widget está envolvido por ViewModelProvider.',
      );
    }
    return provider.notifier!.themeViewModel;
  }
}
