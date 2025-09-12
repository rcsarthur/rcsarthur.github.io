// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `pt_BR`
  String get locale {
    return Intl.message('pt_BR', name: 'locale', desc: '', args: []);
  }

  /// `Currículo Vitae`
  String get appTitle {
    return Intl.message(
      'Currículo Vitae',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Início`
  String get home {
    return Intl.message('Início', name: 'home', desc: '', args: []);
  }

  /// `Experiências`
  String get experiences {
    return Intl.message(
      'Experiências',
      name: 'experiences',
      desc: '',
      args: [],
    );
  }

  /// `Projetos`
  String get projects {
    return Intl.message('Projetos', name: 'projects', desc: '', args: []);
  }

  /// `Habilidades`
  String get skills {
    return Intl.message('Habilidades', name: 'skills', desc: '', args: []);
  }

  /// `Contato`
  String get contact {
    return Intl.message('Contato', name: 'contact', desc: '', args: []);
  }

  /// `Baixar PDF`
  String get downloadPdf {
    return Intl.message('Baixar PDF', name: 'downloadPdf', desc: '', args: []);
  }

  /// `Alternar Tema`
  String get toggleTheme {
    return Intl.message(
      'Alternar Tema',
      name: 'toggleTheme',
      desc: '',
      args: [],
    );
  }

  /// `Alterar Idioma`
  String get changeLanguage {
    return Intl.message(
      'Alterar Idioma',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvedor Flutter/Dart`
  String get heroTitle {
    return Intl.message(
      'Desenvolvedor Flutter/Dart',
      name: 'heroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Apaixonado por criar aplicações mobile e web incríveis`
  String get heroSubtitle {
    return Intl.message(
      'Apaixonado por criar aplicações mobile e web incríveis',
      name: 'heroSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvedor Flutter/Dart com experiência em desenvolvimento mobile e web. Especialista em arquitetura MVVM, gerenciamento de estado nativo e integração com APIs REST.`
  String get heroDescription {
    return Intl.message(
      'Desenvolvedor Flutter/Dart com experiência em desenvolvimento mobile e web. Especialista em arquitetura MVVM, gerenciamento de estado nativo e integração com APIs REST.',
      name: 'heroDescription',
      desc: '',
      args: [],
    );
  }

  /// `São Paulo, SP - Brasil`
  String get heroLocale {
    return Intl.message(
      'São Paulo, SP - Brasil',
      name: 'heroLocale',
      desc: '',
      args: [],
    );
  }

  /// `Entre em Contato`
  String get contactMe {
    return Intl.message(
      'Entre em Contato',
      name: 'contactMe',
      desc: '',
      args: [],
    );
  }

  /// `Principais Tecnologias`
  String get mainTechnologies {
    return Intl.message(
      'Principais Tecnologias',
      name: 'mainTechnologies',
      desc: '',
      args: [],
    );
  }

  /// `Ver Experiências`
  String get navigateToExperiences {
    return Intl.message(
      'Ver Experiências',
      name: 'navigateToExperiences',
      desc: '',
      args: [],
    );
  }

  /// `Ver Projetos`
  String get navigateToProjects {
    return Intl.message(
      'Ver Projetos',
      name: 'navigateToProjects',
      desc: '',
      args: [],
    );
  }

  /// `Ver Habilidades`
  String get navigateToSkills {
    return Intl.message(
      'Ver Habilidades',
      name: 'navigateToSkills',
      desc: '',
      args: [],
    );
  }

  /// `Experiência Profissional`
  String get professionalExperience {
    return Intl.message(
      'Experiência Profissional',
      name: 'professionalExperience',
      desc: '',
      args: [],
    );
  }

  /// `Minha jornada profissional e principais conquistas`
  String get experienceDescription {
    return Intl.message(
      'Minha jornada profissional e principais conquistas',
      name: 'experienceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Atual`
  String get currentJob {
    return Intl.message('Atual', name: 'currentJob', desc: '', args: []);
  }

  /// `Tecnologias`
  String get technologies {
    return Intl.message(
      'Tecnologias',
      name: 'technologies',
      desc: '',
      args: [],
    );
  }

  /// `Conquistas`
  String get achievements {
    return Intl.message('Conquistas', name: 'achievements', desc: '', args: []);
  }

  /// `Projetos`
  String get projectsTitle {
    return Intl.message('Projetos', name: 'projectsTitle', desc: '', args: []);
  }

  /// `Principais projetos desenvolvidos e suas funcionalidades`
  String get projectsDescription {
    return Intl.message(
      'Principais projetos desenvolvidos e suas funcionalidades',
      name: 'projectsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Detalhes do Projeto`
  String get projectDetails {
    return Intl.message(
      'Detalhes do Projeto',
      name: 'projectDetails',
      desc: '',
      args: [],
    );
  }

  /// `Descrição`
  String get description {
    return Intl.message('Descrição', name: 'description', desc: '', args: []);
  }

  /// `Funcionalidades`
  String get features {
    return Intl.message(
      'Funcionalidades',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `mais funcionalidades`
  String get moreFeatures {
    return Intl.message(
      'mais funcionalidades',
      name: 'moreFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Ver Projeto`
  String get viewProject {
    return Intl.message('Ver Projeto', name: 'viewProject', desc: '', args: []);
  }

  /// `Código Fonte`
  String get sourceCode {
    return Intl.message('Código Fonte', name: 'sourceCode', desc: '', args: []);
  }

  /// `Voltar`
  String get goBack {
    return Intl.message('Voltar', name: 'goBack', desc: '', args: []);
  }

  /// `Habilidades`
  String get skillsTitle {
    return Intl.message('Habilidades', name: 'skillsTitle', desc: '', args: []);
  }

  /// `Minhas competências técnicas e soft skills`
  String get skillsDescription {
    return Intl.message(
      'Minhas competências técnicas e soft skills',
      name: 'skillsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Habilidades Técnicas`
  String get technicalSkills {
    return Intl.message(
      'Habilidades Técnicas',
      name: 'technicalSkills',
      desc: '',
      args: [],
    );
  }

  /// `Soft Skills`
  String get softSkills {
    return Intl.message('Soft Skills', name: 'softSkills', desc: '', args: []);
  }

  /// `Nível`
  String get skillLevel {
    return Intl.message('Nível', name: 'skillLevel', desc: '', args: []);
  }

  /// `Exemplos`
  String get examples {
    return Intl.message('Exemplos', name: 'examples', desc: '', args: []);
  }

  /// `Em Desenvolvimento`
  String get projectStatusInProgress {
    return Intl.message(
      'Em Desenvolvimento',
      name: 'projectStatusInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Concluído`
  String get projectStatusCompleted {
    return Intl.message(
      'Concluído',
      name: 'projectStatusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Pausado`
  String get projectStatusPaused {
    return Intl.message(
      'Pausado',
      name: 'projectStatusPaused',
      desc: '',
      args: [],
    );
  }

  /// `Cancelado`
  String get projectStatusCancelled {
    return Intl.message(
      'Cancelado',
      name: 'projectStatusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Iniciante`
  String get skillLevelBeginner {
    return Intl.message(
      'Iniciante',
      name: 'skillLevelBeginner',
      desc: '',
      args: [],
    );
  }

  /// `Intermediário`
  String get skillLevelIntermediate {
    return Intl.message(
      'Intermediário',
      name: 'skillLevelIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Avançado`
  String get skillLevelAdvanced {
    return Intl.message(
      'Avançado',
      name: 'skillLevelAdvanced',
      desc: '',
      args: [],
    );
  }

  /// `Especialista`
  String get skillLevelExpert {
    return Intl.message(
      'Especialista',
      name: 'skillLevelExpert',
      desc: '',
      args: [],
    );
  }

  /// `Técnica`
  String get skillTypeTechnical {
    return Intl.message(
      'Técnica',
      name: 'skillTypeTechnical',
      desc: '',
      args: [],
    );
  }

  /// `Soft Skill`
  String get skillTypeSoft {
    return Intl.message(
      'Soft Skill',
      name: 'skillTypeSoft',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get skillTypeLanguage {
    return Intl.message(
      'Idioma',
      name: 'skillTypeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Enviar Email`
  String get contactTooltipEmail {
    return Intl.message(
      'Enviar Email',
      name: 'contactTooltipEmail',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get contactTooltipWhatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'contactTooltipWhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Perfil LinkedIn`
  String get contactTooltipLinkedin {
    return Intl.message(
      'Perfil LinkedIn',
      name: 'contactTooltipLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `Perfil GitHub`
  String get contactTooltipGithub {
    return Intl.message(
      'Perfil GitHub',
      name: 'contactTooltipGithub',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao carregar dados do currículo`
  String get errorLoadingData {
    return Intl.message(
      'Erro ao carregar dados do currículo',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao gerar PDF`
  String get errorGeneratingPdf {
    return Intl.message(
      'Erro ao gerar PDF',
      name: 'errorGeneratingPdf',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao abrir contato`
  String get errorOpeningContact {
    return Intl.message(
      'Erro ao abrir contato',
      name: 'errorOpeningContact',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao alterar tema`
  String get errorChangingTheme {
    return Intl.message(
      'Erro ao alterar tema',
      name: 'errorChangingTheme',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao alterar idioma`
  String get errorChangingLanguage {
    return Intl.message(
      'Erro ao alterar idioma',
      name: 'errorChangingLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Tentar Novamente`
  String get tryAgain {
    return Intl.message(
      'Tentar Novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Projeto não encontrado`
  String get projectNotFound {
    return Intl.message(
      'Projeto não encontrado',
      name: 'projectNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Carregando...`
  String get loading {
    return Intl.message('Carregando...', name: 'loading', desc: '', args: []);
  }

  /// `Nenhum dado disponível`
  String get noData {
    return Intl.message(
      'Nenhum dado disponível',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `mais`
  String get more {
    return Intl.message('mais', name: 'more', desc: '', args: []);
  }

  /// `Explorar`
  String get explore {
    return Intl.message('Explorar', name: 'explore', desc: '', args: []);
  }

  /// `Contato via currículo GitHub`
  String get emailSubject {
    return Intl.message(
      'Contato via currículo GitHub',
      name: 'emailSubject',
      desc: '',
      args: [],
    );
  }

  /// `Olá, vi seu currículo e gostaria de conversar.`
  String get preDefinedMessage {
    return Intl.message(
      'Olá, vi seu currículo e gostaria de conversar.',
      name: 'preDefinedMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
