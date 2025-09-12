import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/languages.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/state/curriculum_state.dart';
import 'package:curriculum_dart/use_case/contact.use_case.dart';
import 'package:curriculum_dart/use_case/curriculum.use_case.dart';
import 'package:curriculum_dart/use_case/pdf.use_case.dart';
import 'package:flutter/foundation.dart';

class CurriculumViewModel extends ChangeNotifier {
  final CurriculumUseCase _curriculumDataUseCase;
  final PdfUseCase _generatePdfUseCase;
  final ContactUseCase _contactUseCase;

  CurriculumState _state = const CurriculumState();

  CurriculumState get state => _state;

  CurriculumViewModel({
    required CurriculumUseCase getCurriculumDataUseCase,
    required PdfUseCase generatePdfUseCase,
    required ContactUseCase contactUseCase,
  })  : _curriculumDataUseCase = getCurriculumDataUseCase,
        _generatePdfUseCase = generatePdfUseCase,
        _contactUseCase = contactUseCase;

  void _updateState(CurriculumState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadCurriculumData() async {
    _updateState(_state.setLoading(true));
    try {
      final newState = await _curriculumDataUseCase.getAllData();
      _updateState(newState);
    } catch (e) {
      _updateState(_state.setError('Erro ao carregar dados do currículo: $e'));
    }
  }

  Future<void> selectTech(String tech) async {
    final newSelectedTechs = _state.selectedTechs ?? [];
    try {
      if (newSelectedTechs.contains(tech)) {
        newSelectedTechs.remove(tech);
      } else {
        newSelectedTechs.add(tech);
      }
      final newState = _state.copyWith(selectedTechs: newSelectedTechs);
      _updateState(newState);
    } catch (e) {
      _updateState(_state.setError('Erro ao carregar dados do currículo: $e'));
    }
  }

  Future<void> generatePdf(Languages language) async {
    try {
      await _generatePdfUseCase.execute(_state, language);
    } catch (e) {
      _updateState(_state.setError('Erro ao gerar PDF: $e'));
    }
  }

  Future<void> openContact(ContactInfo contactInfo) async {
    try {
      await _contactUseCase.execute(contactInfo);
    } catch (e) {
      _updateState(_state.setError('Erro ao abrir contato: $e'));
    }
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
