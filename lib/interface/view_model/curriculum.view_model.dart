import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/domain/enums/languages.enum.dart';
import 'package:curriculum_dart/domain/enums/skill.enum.dart';
import 'package:curriculum_dart/service/notification.service.dart';
import 'package:curriculum_dart/state/curriculum_state.dart';
import 'package:curriculum_dart/use_case/curriculum.use_case.dart';
import 'package:curriculum_dart/use_case/launch.use_case.dart';
import 'package:curriculum_dart/use_case/pdf.use_case.dart';
import 'package:curriculum_flutter/generated/l10n.dart';
import 'package:curriculum_flutter/interface/view_model/execution/execution.view_model.dart';
import 'package:flutter/foundation.dart';

class CurriculumViewModel extends ChangeNotifier with ExecutionViewModel {
  final CurriculumUseCase _curriculumDataUseCase;
  final PdfUseCase _generatePdfUseCase;
  final LaunchUseCase _launchUseCase;
  final NotificationService _notificationService;

  CurriculumState _state = const CurriculumState();

  @override
  NotificationService get notificationService => _notificationService;

  CurriculumState get state => _state;

  CurriculumViewModel({
    required CurriculumUseCase getCurriculumDataUseCase,
    required PdfUseCase generatePdfUseCase,
    required LaunchUseCase launchUseCase,
    required NotificationService notificationService,
  })  : _curriculumDataUseCase = getCurriculumDataUseCase,
        _generatePdfUseCase = generatePdfUseCase,
        _launchUseCase = launchUseCase,
        _notificationService = notificationService;

  void _updateState(CurriculumState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadCurriculumData() async {
    CurriculumState? newState;
    newState = await executeWithNotification(
      () async => await _curriculumDataUseCase.getAllData(),
      errorMessage: S.current.notificationErrorLoadData,
    );
    if (newState == null) return;
    _updateState(newState);
  }

  Future<void> selectTech(String tech) async {
    final newSelectedTechs = _state.selectedTechs ?? [];
    CurriculumState? newState;
    newState = await executeWithNotification(
      () async {
        if (newSelectedTechs.contains(tech)) {
          newSelectedTechs.remove(tech);
        } else {
          newSelectedTechs.add(tech);
        }
        return _state.copyWith(selectedTechs: newSelectedTechs);
      },
      errorMessage: S.current.notificationErrorSelectFilter,
    );
    if (newState == null) return;
    _updateState(newState);
  }

  Future<void> generatePdf(Languages language) async {
    await executeWithNotification(
      () async => await _generatePdfUseCase.execute(_state, language),
      successMessage: S.current.notificationSuccessGeneratePdf,
      errorMessage: S.current.notificationErrorGeneratePdf,
    );
  }

  Future<void> openContact(ContactInfo contactInfo) async {
    await executeWithNotification(
      () async => await _launchUseCase.openContact(contactInfo),
      errorMessage: S.current.notificationErrorOpenContact(contactInfo.url),
    );
  }

  Future<void> openUrl(String url) async {
    await executeWithNotification(
      () async => await _launchUseCase.openUrl(url),
      errorMessage: S.current.notificationErrorOpenUrl(url),
    );
  }

  void clearError() {
    _updateState(_state.clearError());
  }

  PersonalInfo? get personalInfo => _state.personalInfo;

  List<Experience> get experiences => _state.getSortedExperiences();

  List<String>? get selectedTechs => _state.selectedTechs;

  List<String> get filteredAchievements =>
      _state.experiences.expand((experience) => experience.achievementsListFiltered(_state.selectedTechs)).toList();

  List<Project> get projects => _state.getActiveProjects();

  List<Skill> get technicalSkills => _state.getSkillsByType(SkillType.technical);

  List<Skill> get softSkills => _state.getSkillsByType(SkillType.soft);

  List<ContactInfo> get contactInfo => _state.contactInfo;

  bool get executing => _state.isLoading;

  String? get error => _state.error;
}
