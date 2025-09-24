import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/domain/enums/contact_type.enum.dart';
import 'package:curriculum_dart/domain/enums/project.enum.dart';
import 'package:curriculum_dart/domain/enums/skill.enum.dart';
import 'package:curriculum_dart/repo/curriculum_repo.dart';
import 'package:curriculum_flutter/generated/assets.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;

class LocalCurriculumRepo implements CurriculumRepo {
  static LocalCurriculumRepo? _instancia;

  LocalCurriculumRepo._();

  static LocalCurriculumRepo get instance {
    _instancia ??= LocalCurriculumRepo._();
    return _instancia!;
  }

  @override
  Future<PersonalInfo> getPersonalInfo() async {
    return PersonalInfo(
      name: 'Arthur R C Santos',
      title: S.current.heroTitle,
      email: 'arthur.rcs1@gmail.com',
      phone: '+55 (11) 97556-6343',
      location: S.current.heroLocale,
      summary: S.current.heroDescription,
      profileImageUrl: Assets.imagesProfile,
    );
  }

  @override
  Future<void> updatePersonalInfo(PersonalInfo personalInfo) async {
    // await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<List<Experience>> getExperiences() async {
    return [
      Experience(
        id: '1',
        company: 'Hipcom Informática SS LTDA',
        position: S.current.experienceHipcomPosition,
        startDate: DateTime.parse('2020-10-13'),
        endDate: null,
        isCurrentJob: true,
        description: S.current.experienceHipcomDescription,
        technologies: const [
          'Flutter',
          'Dart',
          'Java',
          'Quarkus',
          'SQLite',
          'MySQL',
          'REST APIs',
          'MobX',
          'i18n',
          'Full-Stack',
          'CI/CD',
          'Design',
        ],
        achievements: {
          S.current.experienceHipcomAchievement1: ['Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement2: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement3: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement4: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement5: ['Flutter', 'Dart', 'MobX', 'Full-Stack'],
          S.current.experienceHipcomAchievement6: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement7: ['Java', 'Quarkus', 'Full-Stack'],
          S.current.experienceHipcomAchievement8: ['Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement9: ['Java', 'Quarkus', 'MySQL', 'Full-Stack'],
          S.current.experienceHipcomAchievement10: ['Flutter', 'Full-Stack'],
          S.current.experienceHipcomAchievement11: ['Java', 'Quarkus', 'Full-Stack'],
          S.current.experienceHipcomAchievement12: ['Flutter', 'Full-Stack'],
          S.current.experienceHipcomAchievement13: ['Flutter', 'i18n', 'Full-Stack'],
          S.current.experienceHipcomAchievement14: ['Flutter', 'Dart', 'Java', 'Quarkus', 'MySQL', 'Full-Stack'],
          S.current.experienceHipcomAchievement15: ['CI/CD', 'Full-Stack'],
          S.current.experienceHipcomAchievement16: ['Flutter', 'Dart', 'CI/CD', 'Full-Stack'],
          S.current.experienceHipcomAchievement17: ['Java', 'Full-Stack'],
          S.current.experienceHipcomAchievement18: ['Flutter', 'Dart', 'SQLite', 'Full-Stack'],
          S.current.experienceHipcomAchievement19: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement20: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement21: ['Flutter', 'Dart', 'Java', 'Quarkus', 'Full-Stack'],
          S.current.experienceHipcomAchievement22: ['Flutter', 'Dart', 'Full-Stack', 'Java', 'Quarkus'],
          S.current.experienceHipcomAchievement23: ['Flutter', 'Dart', 'Full-Stack', 'Java', 'Quarkus'],
          S.current.experienceHipcomAchievement24: ['Flutter', 'Dart', 'Full-Stack'],
          S.current.experienceHipcomAchievement25: ['CI/CD', 'Full-Stack'],
          S.current.experienceHipcomAchievement26: ['Java', 'Quarkus', 'MySQL', 'Full-Stack'],
          S.current.experienceHipcomAchievement27: ['Design', 'Full-Stack'],
          S.current.experienceHipcomAchievement28: ['Design', 'Full-Stack'],
        },
        companyLogo: Assets.iconsHipcomLogo,
      ),
    ];
  }

  @override
  Future<Experience> getExperienceById(String id) async {
    final experiences = await getExperiences();
    return experiences.firstWhere((exp) => exp.id == id);
  }

  @override
  Future<void> addExperience(Experience experience) async {}

  @override
  Future<void> updateExperience(Experience experience) async {}

  @override
  Future<void> deleteExperience(String id) async {}

  @override
  Future<List<Project>> getProjects() async {
    return [
      Project(
        id: '1',
        name: 'Base by Hipcom',
        description: S.current.projectBaseDescription,
        technologies: const ['Flutter', 'Dart', 'SQLite', 'MobX', 'i18n', 'Cache', 'WebSocket'],
        features: [
          S.current.projectBaseFeature1,
          S.current.projectBaseFeature2,
          S.current.projectBaseFeature3,
          S.current.projectBaseFeature4,
          S.current.projectBaseFeature5,
          S.current.projectBaseFeature6,
          S.current.projectBaseFeature7,
          S.current.projectBaseFeature8,
          S.current.projectBaseFeature9,
          S.current.projectBaseFeature10,
          S.current.projectBaseFeature11,
          S.current.projectBaseFeature12,
          S.current.projectBaseFeature13,
          S.current.projectBaseFeature14,
          S.current.projectBaseFeature15,
          S.current.projectBaseFeature16,
        ],
        iconUrl: Assets.imagesLogoBase,
        liveUrl: 'https://hipcomerp.com.br/produtos/aplicativos/base',
        status: ProjectStatus.completed,
      ),
      Project(
        id: '2',
        name: 'Compras by Hipcom',
        description: S.current.projectComprasDescription,
        technologies: const ['Flutter', 'Dart', 'SQLite', 'MobX', 'Cache'],
        features: [
          S.current.projectComprasFeature1,
          S.current.projectComprasFeature2,
          S.current.projectComprasFeature3,
          S.current.projectComprasFeature4,
          S.current.projectComprasFeature5,
          S.current.projectComprasFeature6,
          S.current.projectComprasFeature7,
          S.current.projectComprasFeature8,
          S.current.projectComprasFeature9,
          S.current.projectComprasFeature10,
          S.current.projectComprasFeature11,
        ],
        iconUrl: Assets.imagesLogoCompras,
        liveUrl: 'https://hipcomerp.com.br/produtos/aplicativos/compras',
        status: ProjectStatus.completed,
      ),
      Project(
        id: '3',
        name: 'Hipcom Store',
        description: S.current.projectStoreDescription,
        technologies: const ['Flutter', 'Dart'],
        features: [
          S.current.projectStoreFeature1,
          S.current.projectStoreFeature2,
          S.current.projectStoreFeature3,
        ],
        status: ProjectStatus.inProgress,
      ),
      Project(
        id: '4',
        name: 'Hipcom Store API',
        description: S.current.projectStoreApiDescription,
        technologies: const ['Dart', 'REST API'],
        features: [
          S.current.projectStoreApiFeature1,
          S.current.projectStoreApiFeature2,
        ],
        status: ProjectStatus.inProgress,
      ),
    ];
  }

  @override
  Future<Project> getProjectById(String id) async {
    final projects = await getProjects();
    return projects.firstWhere((project) => project.id == id);
  }

  @override
  Future<void> addProject(Project project) async {}

  @override
  Future<void> updateProject(Project project) async {}

  @override
  Future<void> deleteProject(String id) async {}

  @override
  Future<List<Skill>> getSkills() async {
    return [
      // Technical Skills
      Skill(
        id: '1',
        name: 'Flutter/Dart',
        type: SkillType.technical,
        level: SkillLevel.advanced,
        description: S.current.skillFlutterDescription,
        examples: [
          S.current.skillFlutterExample1,
          S.current.skillFlutterExample2,
          S.current.skillFlutterExample3,
          S.current.skillFlutterExample4,
          S.current.skillFlutterExample5,
          S.current.skillFlutterExample6,
          S.current.skillFlutterExample7,
          S.current.skillFlutterExample8,
          S.current.skillFlutterExample9,
        ],
        iconUrl: 'assets/icons/flutter.png',
      ),
      Skill(
        id: '2',
        name: 'Java/Quarkus',
        type: SkillType.technical,
        level: SkillLevel.intermediate,
        description: S.current.skillJavaDescription,
        examples: [
          S.current.skillJavaExample1,
          S.current.skillJavaExample2,
          S.current.skillJavaExample3,
          S.current.skillJavaExample4,
          S.current.skillJavaExample5,
          S.current.skillJavaExample6,
        ],
        iconUrl: 'assets/icons/java.png',
      ),
      Skill(
        id: '3',
        name: 'SQLite/MySQL',
        type: SkillType.technical,
        level: SkillLevel.intermediate,
        description: S.current.skillDatabaseDescription,
        examples: [
          S.current.skillDatabaseExample1,
          S.current.skillDatabaseExample2,
          S.current.skillDatabaseExample3,
        ],
        iconUrl: 'assets/icons/database.png',
      ),
      Skill(
        id: '4',
        name: 'CI/CD',
        type: SkillType.technical,
        level: SkillLevel.intermediate,
        description: S.current.skillCicdDescription,
        examples: [
          S.current.skillCicdExample1,
        ],
        iconUrl: 'assets/icons/database.png',
      ),
      // Soft Skills
      Skill(
        id: '5',
        name: S.current.skillTeamworkName,
        type: SkillType.soft,
        level: SkillLevel.advanced,
        description: S.current.skillTeamworkDescription,
        examples: [
          S.current.skillTeamworkExample1,
          S.current.skillTeamworkExample2,
          S.current.skillTeamworkExample3,
          S.current.skillTeamworkExample4,
          S.current.skillTeamworkExample5,
        ],
      ),
      Skill(
        id: '6',
        name: S.current.skillProblemSolvingName,
        type: SkillType.soft,
        level: SkillLevel.advanced,
        description: S.current.skillProblemSolvingDescription,
        examples: [
          S.current.skillProblemSolvingExample1,
          S.current.skillProblemSolvingExample2,
          S.current.skillProblemSolvingExample3,
          S.current.skillProblemSolvingExample4,
        ],
      ),
      Skill(
        id: '7',
        name: S.current.skillAnalyticalAbilityName,
        type: SkillType.soft,
        level: SkillLevel.advanced,
        description: S.current.skillAnalyticalAbilityDescription,
        examples: [
          S.current.skillAnalyticalAbilityExample1,
          S.current.skillAnalyticalAbilityExample2,
          S.current.skillAnalyticalAbilityExample3,
        ],
      ),
    ];
  }

  @override
  Future<List<Skill>> getSkillsByType(SkillType type) async {
    final skills = await getSkills();
    return skills.where((skill) => skill.type == type).toList();
  }

  @override
  Future<void> addSkill(Skill skill) async {}

  @override
  Future<void> updateSkill(Skill skill) async {}

  @override
  Future<void> deleteSkill(String id) async {}

  @override
  Future<List<ContactInfo>> getContactInfo() async {
    return [
      ContactInfo(
        type: ContactType.email,
        label: 'Email',
        value: 'arthur.rcs1@gmail.com',
        url:
            'mailto:arthur.rcs1@gmail.com?subject=Contato%20via%20Currículo&body=Olá,%20vi%20seu%20currículo%20e%20gostaria%20de%20conversar.',
        iconName: 'email',
        preDefinedMessage: S.current.preDefinedMessage,
      ),
      ContactInfo(
        type: ContactType.whatsapp,
        label: 'WhatsApp',
        value: '5511975566343',
        url:
            'https://wa.me/5511975566343?text=Olá,%20vi%20seu%20currículo%20e%20gostaria%20de%20conversar%20sobre%20oportunidades.',
        iconName: 'whatsapp',
        preDefinedMessage: S.current.preDefinedMessage,
      ),
      const ContactInfo(
        type: ContactType.linkedin,
        label: 'LinkedIn',
        value: 'linkedin.com/in/tuzinho00',
        url: 'https://linkedin.com/in/tuzinho00',
        iconName: 'linkedin',
      ),
      const ContactInfo(
        type: ContactType.github,
        label: 'GitHub',
        value: 'github.com/rcsarthur',
        url: 'https://github.com/rcsarthur',
        iconName: 'github',
      ),
    ];
  }

  @override
  Future<void> updateContactInfo(List<ContactInfo> contactInfo) async {}
}
