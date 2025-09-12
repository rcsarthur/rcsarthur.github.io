import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_dart/domain/entities/contact_type.dart';
import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/repo/curriculum_repo.dart';
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
      profileImageUrl: 'assets/images/profile.jpg',
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
        position: 'Desenvolvedor Júnior Full-Stack',
        startDate: DateTime.parse('2020-09-13'),
        endDate: null,
        isCurrentJob: true,
        description:
            'Desenvolvimento de aplicações mobile, desktop e web utilizando Flutter/Dart, integração com APIs REST, desenvolvimento backend com Java/Quarkus, e gerenciamento de banco de dados SQLite e MySQL.',
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
        achievements: const {
          'Integração com sistemas backend utilizando *dio* e *http*': ['Dart', 'Full-Stack'],
          'Implementação de Clean Architecture': ['Flutter', 'Dart', 'Full-Stack'],
          'Otimização de performance de aplicações analizando *Flutter DevTools* no Android Studio (é horrível testar um app e o celular esquentar na mão)':
              ['Flutter', 'Dart', 'Full-Stack'],
          'Gerenciamento de cache utilizando *shared_preferences*': ['Flutter', 'Dart', 'Full-Stack'],
          'Gerenciamento de estado utilizando MobX e método nativo do Flutter': [
            'Flutter',
            'Dart',
            'MobX',
            'Full-Stack'
          ],
          'Desenvolvimento de múltiplas aplicações Mobile, Desktop e Web utilizando Flutter': [
            'Flutter',
            'Dart',
            'Full-Stack'
          ],
          'Desenvolvimento de microsserviços utilizando Quarkus': ['Java', 'Quarkus', 'Full-Stack'],
          'Desenvolvimento de API REST utilizando Dart com a lib *shelf*': ['Dart', 'Full-Stack'],
          'Desenvolvimento de API REST para conectar os apps ao MySQL utilizando Quarkus e *jdbc*': [
            'Java',
            'Quarkus',
            'MySQL',
            'Full-Stack'
          ],
          'Desenvolvimento de interfaces responsivas': ['Flutter', 'Full-Stack'],
          'Desenvolvimento de testes unitários': ['Java', 'Quarkus', 'Full-Stack'],
          'Implementação de gráficos e relatórios utilizando *fl_chart*': ['Flutter', 'Full-Stack'],
          'Implementação de internationalization (i18n) utilizando *flutter_intl* e *flutter_localizations* - Português, Inglês, Espanhol e Chinês':
              ['Flutter', 'i18n', 'Full-Stack'],
          'Implementação de cálculos complexos com impostos, tanto no Front-End quanto no Back-End e em Queries MySQL':
              ['Flutter', 'Dart', 'Java', 'Quarkus', 'MySQL', 'Full-Stack'],
          'Implementação de CI/CD mobile utilizando *codemagic*': ['CI/CD', 'Full-Stack'],
          'Implementação de builds para Desktop utilizando msix e Inno Setup Compiler (o projeto ainda não foi publicado para a Microsoft Store)':
              ['Flutter', 'Dart', 'CI/CD', 'Full-Stack'],
          'Implementação de Multithreading em Java': ['Java', 'Full-Stack'],
          'Implementação de modo Offline utilizando *sqflite*': ['Flutter', 'Dart', 'SQLite', 'Full-Stack'],
          'Implementação de *Isolate* para realizar tarefas custosas em paralelo': ['Flutter', 'Dart', 'Full-Stack'],
          'Implementação de animações customizadas': ['Flutter', 'Dart', 'Full-Stack'],
          'Implementação de exportação de logs zipados para Amazon S3 utilizando lib *logger*': [
            'Flutter',
            'Dart',
            'Java',
            'Quarkus',
            'Full-Stack'
          ],
          'Implementação de filtros para realizar buscas em listas': [
            'Flutter',
            'Dart',
            'Full-Stack',
            'Java',
            'Quarkus'
          ],
          'Implementação de buscas paginadas: Offset e Cursor': ['Flutter', 'Dart', 'Full-Stack', 'Java', 'Quarkus'],
          'Implementação de chat com IA (Hippi) utilizando WebSocket': ['Flutter', 'Dart', 'Full-Stack'],
          'Criação de script .ps1 para gerar um atalho na Área de Trabalho do Windows para aplicativos Desktop (msix não faz isso nativamente)':
              ['CI/CD', 'Full-Stack'],
          'Otimização de Queries MySQL: otimizações de queries complexas, reduzindo o tempo de execução, um select específico de produtos estava demorando mais de 1 minuto, eu diminuí o tempo para menos de 20 segundos com uso de lotes em Java':
              ['Java', 'Quarkus', 'MySQL', 'Full-Stack'],
          'Ajuda na criação do novo site da empresa utilizando *Framer*': ['Design', 'Full-Stack'],
          'Ajuda com SEO do novo site da empresa': ['Design', 'Full-Stack'],
        },
        companyLogo: 'assets/images/hipcom_logo.svg',
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
      const Project(
        id: '1',
        name: 'App de Gestão Empresarial',
        description:
            'Aplicativo mobile para gestão empresarial com funcionalidades de controle de estoque, vendas e relatórios.',
        technologies: ['Flutter', 'Dart', 'SQLite', 'Provider'],
        features: [
          'Controle de estoque em tempo real',
          'Sistema de vendas integrado',
          'Relatórios detalhados',
          'Interface responsiva',
          'Sincronização offline'
        ],
        iconUrl: 'assets/icons/business_app.png',
        imageUrl: 'assets/images/business_app_screenshot.png',
        startDate: '2023-03-01',
        endDate: '2023-08-01',
        status: ProjectStatus.completed,
      ),
      const Project(
        id: '2',
        name: 'Sistema de Monitoramento',
        description: 'Sistema web para monitoramento de equipamentos industriais com dashboard em tempo real.',
        technologies: ['Flutter Web', 'Dart', 'WebSocket', 'Charts'],
        features: [
          'Dashboard em tempo real',
          'Alertas automáticos',
          'Histórico de dados',
          'Relatórios customizáveis',
          'Interface responsiva'
        ],
        iconUrl: 'assets/icons/monitoring_system.png',
        imageUrl: 'assets/images/monitoring_system_screenshot.png',
        startDate: '2023-09-01',
        endDate: null,
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
      const Skill(
        id: '1',
        name: 'Flutter/Dart',
        type: SkillType.technical,
        level: SkillLevel.advanced,
        description: 'Desenvolvimento de aplicações mobile e web com Flutter',
        examples: [
          'Criação de apps complexos com arquitetura MVVM',
          'Implementação de animações customizadas',
          'Integração com APIs REST'
        ],
        iconUrl: 'assets/icons/flutter.png',
      ),
      const Skill(
        id: '2',
        name: 'Java/Quarkus',
        type: SkillType.technical,
        level: SkillLevel.intermediate,
        description: 'Desenvolvimento backend com Java e framework Quarkus',
        examples: ['Criação de APIs REST', 'Integração com banco de dados', 'Implementação de microserviços'],
        iconUrl: 'assets/icons/java.png',
      ),
      const Skill(
        id: '3',
        name: 'SQLite/MySQL',
        type: SkillType.technical,
        level: SkillLevel.intermediate,
        description: 'Gerenciamento e otimização de banco de dados',
        examples: ['Design de esquemas de banco', 'Otimização de queries', 'Migração de dados'],
        iconUrl: 'assets/icons/database.png',
      ),
      // Soft Skills
      const Skill(
        id: '4',
        name: 'Trabalho em Equipe',
        type: SkillType.soft,
        level: SkillLevel.advanced,
        description: 'Colaboração efetiva em projetos de equipe',
        examples: [
          'Participação ativa em reuniões de planejamento',
          'Mentoria de desenvolvedores júnior',
          'Resolução colaborativa de problemas'
        ],
      ),
      const Skill(
        id: '5',
        name: 'Resolução de Problemas',
        type: SkillType.soft,
        level: SkillLevel.advanced,
        description: 'Análise e solução de problemas complexos',
        examples: [
          'Debug de aplicações em produção',
          'Otimização de performance',
          'Implementação de soluções criativas'
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
        value: 'github.com/RCSArthur',
        url: 'https://github.com/RCSArthur',
        iconName: 'github',
      ),
    ];
  }

  @override
  Future<void> updateContactInfo(List<ContactInfo> contactInfo) async {}
}
