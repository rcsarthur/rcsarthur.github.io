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

  /// `Desenvolvedor Flutter/Dart com experiência em desenvolvimento mobile, desktop e web. Especialista em Clean Architecture, gerenciamento de estado nativo, integração com APIs REST, internacionalização (i18n), gereciamento de temas e CI/CD.`
  String get heroDescription {
    return Intl.message(
      'Desenvolvedor Flutter/Dart com experiência em desenvolvimento mobile, desktop e web. Especialista em Clean Architecture, gerenciamento de estado nativo, integração com APIs REST, internacionalização (i18n), gereciamento de temas e CI/CD.',
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

  /// `Resumo Profissional`
  String get professionalSummary {
    return Intl.message(
      'Resumo Profissional',
      name: 'professionalSummary',
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

  /// `Presente`
  String get present {
    return Intl.message('Presente', name: 'present', desc: '', args: []);
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

  /// `Desenvolvedor Júnior Full-Stack`
  String get experienceHipcomPosition {
    return Intl.message(
      'Desenvolvedor Júnior Full-Stack',
      name: 'experienceHipcomPosition',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de aplicações mobile, desktop e web utilizando Flutter/Dart, integração com APIs REST, desenvolvimento backend com Java/Quarkus e gerenciamento de banco de dados SQLite e MySQL.`
  String get experienceHipcomDescription {
    return Intl.message(
      'Desenvolvimento de aplicações mobile, desktop e web utilizando Flutter/Dart, integração com APIs REST, desenvolvimento backend com Java/Quarkus e gerenciamento de banco de dados SQLite e MySQL.',
      name: 'experienceHipcomDescription',
      desc: '',
      args: [],
    );
  }

  /// `Integração com sistemas backend utilizando *dio* e *http*`
  String get experienceHipcomAchievement1 {
    return Intl.message(
      'Integração com sistemas backend utilizando *dio* e *http*',
      name: 'experienceHipcomAchievement1',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de Clean Architecture`
  String get experienceHipcomAchievement2 {
    return Intl.message(
      'Implementação de Clean Architecture',
      name: 'experienceHipcomAchievement2',
      desc: '',
      args: [],
    );
  }

  /// `Otimização de performance de aplicações analizando *Flutter DevTools* no Android Studio (é horrível testar um app e o celular esquentar na mão )`
  String get experienceHipcomAchievement3 {
    return Intl.message(
      'Otimização de performance de aplicações analizando *Flutter DevTools* no Android Studio (é horrível testar um app e o celular esquentar na mão )',
      name: 'experienceHipcomAchievement3',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de cache utilizando *shared_preferences*`
  String get experienceHipcomAchievement4 {
    return Intl.message(
      'Gerenciamento de cache utilizando *shared_preferences*',
      name: 'experienceHipcomAchievement4',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de estado utilizando MobX e método nativo do Flutter`
  String get experienceHipcomAchievement5 {
    return Intl.message(
      'Gerenciamento de estado utilizando MobX e método nativo do Flutter',
      name: 'experienceHipcomAchievement5',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de múltiplas aplicações Mobile, Desktop e Web utilizando Flutter`
  String get experienceHipcomAchievement6 {
    return Intl.message(
      'Desenvolvimento de múltiplas aplicações Mobile, Desktop e Web utilizando Flutter',
      name: 'experienceHipcomAchievement6',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de microsserviços utilizando Quarkus`
  String get experienceHipcomAchievement7 {
    return Intl.message(
      'Desenvolvimento de microsserviços utilizando Quarkus',
      name: 'experienceHipcomAchievement7',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de API REST utilizando Dart com a lib *shelf*`
  String get experienceHipcomAchievement8 {
    return Intl.message(
      'Desenvolvimento de API REST utilizando Dart com a lib *shelf*',
      name: 'experienceHipcomAchievement8',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de API REST para conectar os apps ao MySQL utilizando Quarkus e *jdbc*`
  String get experienceHipcomAchievement9 {
    return Intl.message(
      'Desenvolvimento de API REST para conectar os apps ao MySQL utilizando Quarkus e *jdbc*',
      name: 'experienceHipcomAchievement9',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de interfaces responsivas`
  String get experienceHipcomAchievement10 {
    return Intl.message(
      'Desenvolvimento de interfaces responsivas',
      name: 'experienceHipcomAchievement10',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de testes unitários`
  String get experienceHipcomAchievement11 {
    return Intl.message(
      'Desenvolvimento de testes unitários',
      name: 'experienceHipcomAchievement11',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de gráficos e relatórios utilizando *fl_chart*`
  String get experienceHipcomAchievement12 {
    return Intl.message(
      'Implementação de gráficos e relatórios utilizando *fl_chart*',
      name: 'experienceHipcomAchievement12',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de internationalization (i18n) utilizando *flutter_intl* e *flutter_localizations* - Português, Inglês, Espanhol e Chinês`
  String get experienceHipcomAchievement13 {
    return Intl.message(
      'Implementação de internationalization (i18n) utilizando *flutter_intl* e *flutter_localizations* - Português, Inglês, Espanhol e Chinês',
      name: 'experienceHipcomAchievement13',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de cálculos complexos com impostos, tanto no Front-End quanto no Back-End e em Queries MySQL`
  String get experienceHipcomAchievement14 {
    return Intl.message(
      'Implementação de cálculos complexos com impostos, tanto no Front-End quanto no Back-End e em Queries MySQL',
      name: 'experienceHipcomAchievement14',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de CI/CD mobile utilizando *codemagic*`
  String get experienceHipcomAchievement15 {
    return Intl.message(
      'Implementação de CI/CD mobile utilizando *codemagic*',
      name: 'experienceHipcomAchievement15',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de builds para Desktop utilizando msix e Inno Setup Compiler (o projeto ainda não foi publicado para a Microsoft Store)`
  String get experienceHipcomAchievement16 {
    return Intl.message(
      'Implementação de builds para Desktop utilizando msix e Inno Setup Compiler (o projeto ainda não foi publicado para a Microsoft Store)',
      name: 'experienceHipcomAchievement16',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de Multithreading em Java`
  String get experienceHipcomAchievement17 {
    return Intl.message(
      'Implementação de Multithreading em Java',
      name: 'experienceHipcomAchievement17',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de modo Offline utilizando *sqflite*`
  String get experienceHipcomAchievement18 {
    return Intl.message(
      'Implementação de modo Offline utilizando *sqflite*',
      name: 'experienceHipcomAchievement18',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de *Isolate* para realizar tarefas custosas em paralelo`
  String get experienceHipcomAchievement19 {
    return Intl.message(
      'Implementação de *Isolate* para realizar tarefas custosas em paralelo',
      name: 'experienceHipcomAchievement19',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de animações customizadas`
  String get experienceHipcomAchievement20 {
    return Intl.message(
      'Implementação de animações customizadas',
      name: 'experienceHipcomAchievement20',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de exportação de logs zipados para Amazon S3 utilizando lib *logger*`
  String get experienceHipcomAchievement21 {
    return Intl.message(
      'Implementação de exportação de logs zipados para Amazon S3 utilizando lib *logger*',
      name: 'experienceHipcomAchievement21',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de filtros para realizar buscas em listas`
  String get experienceHipcomAchievement22 {
    return Intl.message(
      'Implementação de filtros para realizar buscas em listas',
      name: 'experienceHipcomAchievement22',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de buscas paginadas: Offset e Cursor`
  String get experienceHipcomAchievement23 {
    return Intl.message(
      'Implementação de buscas paginadas: Offset e Cursor',
      name: 'experienceHipcomAchievement23',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de chat com IA (Hippi) utilizando WebSocket`
  String get experienceHipcomAchievement24 {
    return Intl.message(
      'Implementação de chat com IA (Hippi) utilizando WebSocket',
      name: 'experienceHipcomAchievement24',
      desc: '',
      args: [],
    );
  }

  /// `Criação de script .ps1 para gerar um atalho na Área de Trabalho do Windows para aplicativos Desktop (msix não faz isso nativamente)`
  String get experienceHipcomAchievement25 {
    return Intl.message(
      'Criação de script .ps1 para gerar um atalho na Área de Trabalho do Windows para aplicativos Desktop (msix não faz isso nativamente)',
      name: 'experienceHipcomAchievement25',
      desc: '',
      args: [],
    );
  }

  /// `Otimização de Queries MySQL: otimizações de queries complexas, reduzindo o tempo de execução, um select específico de produtos estava demorando mais de 1 minuto, eu diminuí o tempo para menos de 20 segundos com uso de lotes em Java`
  String get experienceHipcomAchievement26 {
    return Intl.message(
      'Otimização de Queries MySQL: otimizações de queries complexas, reduzindo o tempo de execução, um select específico de produtos estava demorando mais de 1 minuto, eu diminuí o tempo para menos de 20 segundos com uso de lotes em Java',
      name: 'experienceHipcomAchievement26',
      desc: '',
      args: [],
    );
  }

  /// `Ajuda na criação do novo site da empresa utilizando *Framer*`
  String get experienceHipcomAchievement27 {
    return Intl.message(
      'Ajuda na criação do novo site da empresa utilizando *Framer*',
      name: 'experienceHipcomAchievement27',
      desc: '',
      args: [],
    );
  }

  /// `Ajuda com SEO do novo site da empresa`
  String get experienceHipcomAchievement28 {
    return Intl.message(
      'Ajuda com SEO do novo site da empresa',
      name: 'experienceHipcomAchievement28',
      desc: '',
      args: [],
    );
  }

  /// `Aplicativo mobile e desktop para gestão de varejo com funcionalidades de controle de produtos, vendas e demais relatórios.`
  String get projectBaseDescription {
    return Intl.message(
      'Aplicativo mobile e desktop para gestão de varejo com funcionalidades de controle de produtos, vendas e demais relatórios.',
      name: 'projectBaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de estado utilizando MobX`
  String get projectBaseFeature1 {
    return Intl.message(
      'Gerenciamento de estado utilizando MobX',
      name: 'projectBaseFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de singletons utilizando GetIt`
  String get projectBaseFeature2 {
    return Intl.message(
      'Gerenciamento de singletons utilizando GetIt',
      name: 'projectBaseFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Controle de dados cruciais em tempo real`
  String get projectBaseFeature3 {
    return Intl.message(
      'Controle de dados cruciais em tempo real',
      name: 'projectBaseFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Relatórios detalhados`
  String get projectBaseFeature4 {
    return Intl.message(
      'Relatórios detalhados',
      name: 'projectBaseFeature4',
      desc: '',
      args: [],
    );
  }

  /// `Interface responsiva`
  String get projectBaseFeature5 {
    return Intl.message(
      'Interface responsiva',
      name: 'projectBaseFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Sincronização offline`
  String get projectBaseFeature6 {
    return Intl.message(
      'Sincronização offline',
      name: 'projectBaseFeature6',
      desc: '',
      args: [],
    );
  }

  /// `Modo Desktop`
  String get projectBaseFeature7 {
    return Intl.message(
      'Modo Desktop',
      name: 'projectBaseFeature7',
      desc: '',
      args: [],
    );
  }

  /// `Tema escuro`
  String get projectBaseFeature8 {
    return Intl.message(
      'Tema escuro',
      name: 'projectBaseFeature8',
      desc: '',
      args: [],
    );
  }

  /// `Gráficos e tabelas`
  String get projectBaseFeature9 {
    return Intl.message(
      'Gráficos e tabelas',
      name: 'projectBaseFeature9',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de diferentes redes para usuários com diversas lojas`
  String get projectBaseFeature10 {
    return Intl.message(
      'Gerenciamento de diferentes redes para usuários com diversas lojas',
      name: 'projectBaseFeature10',
      desc: '',
      args: [],
    );
  }

  /// `Funções Isolated para tarefas em background`
  String get projectBaseFeature11 {
    return Intl.message(
      'Funções Isolated para tarefas em background',
      name: 'projectBaseFeature11',
      desc: '',
      args: [],
    );
  }

  /// `Tradução para Português, Inglês, Espanhol e Chinês`
  String get projectBaseFeature12 {
    return Intl.message(
      'Tradução para Português, Inglês, Espanhol e Chinês',
      name: 'projectBaseFeature12',
      desc: '',
      args: [],
    );
  }

  /// `Verificação biométrica para autenticação`
  String get projectBaseFeature13 {
    return Intl.message(
      'Verificação biométrica para autenticação',
      name: 'projectBaseFeature13',
      desc: '',
      args: [],
    );
  }

  /// `Login automático de usuários já autenticados`
  String get projectBaseFeature14 {
    return Intl.message(
      'Login automático de usuários já autenticados',
      name: 'projectBaseFeature14',
      desc: '',
      args: [],
    );
  }

  /// `Registro de metas de vendas e compras`
  String get projectBaseFeature15 {
    return Intl.message(
      'Registro de metas de vendas e compras',
      name: 'projectBaseFeature15',
      desc: '',
      args: [],
    );
  }

  /// `Integração por meio de WebSocket para HippiAI (inteligência artificial da Hipcom) para perguntas sobre gráficos disponíveis no app`
  String get projectBaseFeature16 {
    return Intl.message(
      'Integração por meio de WebSocket para HippiAI (inteligência artificial da Hipcom) para perguntas sobre gráficos disponíveis no app',
      name: 'projectBaseFeature16',
      desc: '',
      args: [],
    );
  }

  /// `Aplicativo mobile para gestão de compras direto de fornecedores com funcionalidades de cadastro de produtos, compras e relatórios.`
  String get projectComprasDescription {
    return Intl.message(
      'Aplicativo mobile para gestão de compras direto de fornecedores com funcionalidades de cadastro de produtos, compras e relatórios.',
      name: 'projectComprasDescription',
      desc: '',
      args: [],
    );
  }

  /// `Clean Architecture`
  String get projectComprasFeature1 {
    return Intl.message(
      'Clean Architecture',
      name: 'projectComprasFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de estado utilizando MobX`
  String get projectComprasFeature2 {
    return Intl.message(
      'Gerenciamento de estado utilizando MobX',
      name: 'projectComprasFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de singletons utilizando GetIt`
  String get projectComprasFeature3 {
    return Intl.message(
      'Gerenciamento de singletons utilizando GetIt',
      name: 'projectComprasFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Histórico de compras`
  String get projectComprasFeature4 {
    return Intl.message(
      'Histórico de compras',
      name: 'projectComprasFeature4',
      desc: '',
      args: [],
    );
  }

  /// `Busca de produtos a partir de filtros e em lote`
  String get projectComprasFeature5 {
    return Intl.message(
      'Busca de produtos a partir de filtros e em lote',
      name: 'projectComprasFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Histórico de busca de produtos`
  String get projectComprasFeature6 {
    return Intl.message(
      'Histórico de busca de produtos',
      name: 'projectComprasFeature6',
      desc: '',
      args: [],
    );
  }

  /// `Busca e associação de forncedores a produtos`
  String get projectComprasFeature7 {
    return Intl.message(
      'Busca e associação de forncedores a produtos',
      name: 'projectComprasFeature7',
      desc: '',
      args: [],
    );
  }

  /// `Sincronização e permanência de dados offline`
  String get projectComprasFeature8 {
    return Intl.message(
      'Sincronização e permanência de dados offline',
      name: 'projectComprasFeature8',
      desc: '',
      args: [],
    );
  }

  /// `Funções Isolated para tarefas em background`
  String get projectComprasFeature9 {
    return Intl.message(
      'Funções Isolated para tarefas em background',
      name: 'projectComprasFeature9',
      desc: '',
      args: [],
    );
  }

  /// `Busca por código de barras utilizando câmera com validação para evitar erros de leitura`
  String get projectComprasFeature10 {
    return Intl.message(
      'Busca por código de barras utilizando câmera com validação para evitar erros de leitura',
      name: 'projectComprasFeature10',
      desc: '',
      args: [],
    );
  }

  /// `Cálculo de embalagens e preço final automático`
  String get projectComprasFeature11 {
    return Intl.message(
      'Cálculo de embalagens e preço final automático',
      name: 'projectComprasFeature11',
      desc: '',
      args: [],
    );
  }

  /// `Aplicativo mobile para gerenciamento de outros apps da Hipcom, permitindo instalar, atualizar, remover e abrir sem precisar procurar na loja do dispositivo.`
  String get projectStoreDescription {
    return Intl.message(
      'Aplicativo mobile para gerenciamento de outros apps da Hipcom, permitindo instalar, atualizar, remover e abrir sem precisar procurar na loja do dispositivo.',
      name: 'projectStoreDescription',
      desc: '',
      args: [],
    );
  }

  /// `Instalar, atualizar, remover e abrir outros apps da Hipcom`
  String get projectStoreFeature1 {
    return Intl.message(
      'Instalar, atualizar, remover e abrir outros apps da Hipcom',
      name: 'projectStoreFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Clean Architecture`
  String get projectStoreFeature2 {
    return Intl.message(
      'Clean Architecture',
      name: 'projectStoreFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de estado nativo do Flutter`
  String get projectStoreFeature3 {
    return Intl.message(
      'Gerenciamento de estado nativo do Flutter',
      name: 'projectStoreFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Interface CLI para chamadas REST do Hipcom Store, comunicando com banco de dados e Play Store.`
  String get projectStoreApiDescription {
    return Intl.message(
      'Interface CLI para chamadas REST do Hipcom Store, comunicando com banco de dados e Play Store.',
      name: 'projectStoreApiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Arquitetura MVC`
  String get projectStoreApiFeature1 {
    return Intl.message(
      'Arquitetura MVC',
      name: 'projectStoreApiFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Autenticação de rotas utilizando tokens`
  String get projectStoreApiFeature2 {
    return Intl.message(
      'Autenticação de rotas utilizando tokens',
      name: 'projectStoreApiFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento de aplicações mobile, desktop e web com Flutter`
  String get skillFlutterDescription {
    return Intl.message(
      'Desenvolvimento de aplicações mobile, desktop e web com Flutter',
      name: 'skillFlutterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Criação de apps complexos com arquitetura MVVM/Clean Architecture e Clean Code`
  String get skillFlutterExample1 {
    return Intl.message(
      'Criação de apps complexos com arquitetura MVVM/Clean Architecture e Clean Code',
      name: 'skillFlutterExample1',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de animações customizadas`
  String get skillFlutterExample2 {
    return Intl.message(
      'Implementação de animações customizadas',
      name: 'skillFlutterExample2',
      desc: '',
      args: [],
    );
  }

  /// `Integração com APIs REST`
  String get skillFlutterExample3 {
    return Intl.message(
      'Integração com APIs REST',
      name: 'skillFlutterExample3',
      desc: '',
      args: [],
    );
  }

  /// `Internacionalização (i18n)`
  String get skillFlutterExample4 {
    return Intl.message(
      'Internacionalização (i18n)',
      name: 'skillFlutterExample4',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de estado utilizando MobX e método nativo do Flutter`
  String get skillFlutterExample5 {
    return Intl.message(
      'Gerenciamento de estado utilizando MobX e método nativo do Flutter',
      name: 'skillFlutterExample5',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento de cache utilizando *shared_preferences*`
  String get skillFlutterExample6 {
    return Intl.message(
      'Gerenciamento de cache utilizando *shared_preferences*',
      name: 'skillFlutterExample6',
      desc: '',
      args: [],
    );
  }

  /// `Otimização de performance de aplicações analizando *Flutter DevTools* no Android Studio`
  String get skillFlutterExample7 {
    return Intl.message(
      'Otimização de performance de aplicações analizando *Flutter DevTools* no Android Studio',
      name: 'skillFlutterExample7',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de verificação biométrica para autenticação`
  String get skillFlutterExample8 {
    return Intl.message(
      'Implementação de verificação biométrica para autenticação',
      name: 'skillFlutterExample8',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de CI/CD mobile utilizando *codemagic*`
  String get skillFlutterExample9 {
    return Intl.message(
      'Implementação de CI/CD mobile utilizando *codemagic*',
      name: 'skillFlutterExample9',
      desc: '',
      args: [],
    );
  }

  /// `Desenvolvimento backend com Java e framework Quarkus`
  String get skillJavaDescription {
    return Intl.message(
      'Desenvolvimento backend com Java e framework Quarkus',
      name: 'skillJavaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Criação de APIs REST`
  String get skillJavaExample1 {
    return Intl.message(
      'Criação de APIs REST',
      name: 'skillJavaExample1',
      desc: '',
      args: [],
    );
  }

  /// `Integração com banco de dados`
  String get skillJavaExample2 {
    return Intl.message(
      'Integração com banco de dados',
      name: 'skillJavaExample2',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de microserviços`
  String get skillJavaExample3 {
    return Intl.message(
      'Implementação de microserviços',
      name: 'skillJavaExample3',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de multithreading`
  String get skillJavaExample4 {
    return Intl.message(
      'Implementação de multithreading',
      name: 'skillJavaExample4',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de testes unitários`
  String get skillJavaExample5 {
    return Intl.message(
      'Implementação de testes unitários',
      name: 'skillJavaExample5',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de filtros na chamada de endpoints`
  String get skillJavaExample6 {
    return Intl.message(
      'Implementação de filtros na chamada de endpoints',
      name: 'skillJavaExample6',
      desc: '',
      args: [],
    );
  }

  /// `Gerenciamento e otimização de banco de dados`
  String get skillDatabaseDescription {
    return Intl.message(
      'Gerenciamento e otimização de banco de dados',
      name: 'skillDatabaseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Design de esquemas de banco`
  String get skillDatabaseExample1 {
    return Intl.message(
      'Design de esquemas de banco',
      name: 'skillDatabaseExample1',
      desc: '',
      args: [],
    );
  }

  /// `Otimização e criação de queries complexas`
  String get skillDatabaseExample2 {
    return Intl.message(
      'Otimização e criação de queries complexas',
      name: 'skillDatabaseExample2',
      desc: '',
      args: [],
    );
  }

  /// `Migração de esquema de banco de dados utilizando *migration* (em MySQL e SQLite)`
  String get skillDatabaseExample3 {
    return Intl.message(
      'Migração de esquema de banco de dados utilizando *migration* (em MySQL e SQLite)',
      name: 'skillDatabaseExample3',
      desc: '',
      args: [],
    );
  }

  /// `Deploy atutomático de aplicações`
  String get skillCicdDescription {
    return Intl.message(
      'Deploy atutomático de aplicações',
      name: 'skillCicdDescription',
      desc: '',
      args: [],
    );
  }

  /// `Deploy de aplicações mobile, desktop e web utilizando *codemagic* e *Github Actions*`
  String get skillCicdExample1 {
    return Intl.message(
      'Deploy de aplicações mobile, desktop e web utilizando *codemagic* e *Github Actions*',
      name: 'skillCicdExample1',
      desc: '',
      args: [],
    );
  }

  /// `Trabalho em Equipe`
  String get skillTeamworkName {
    return Intl.message(
      'Trabalho em Equipe',
      name: 'skillTeamworkName',
      desc: '',
      args: [],
    );
  }

  /// `Colaboração efetiva em projetos de equipe`
  String get skillTeamworkDescription {
    return Intl.message(
      'Colaboração efetiva em projetos de equipe',
      name: 'skillTeamworkDescription',
      desc: '',
      args: [],
    );
  }

  /// `Participação ativa em reuniões de planejamento`
  String get skillTeamworkExample1 {
    return Intl.message(
      'Participação ativa em reuniões de planejamento',
      name: 'skillTeamworkExample1',
      desc: '',
      args: [],
    );
  }

  /// `Mentoria de desenvolvedores júnior`
  String get skillTeamworkExample2 {
    return Intl.message(
      'Mentoria de desenvolvedores júnior',
      name: 'skillTeamworkExample2',
      desc: '',
      args: [],
    );
  }

  /// `Resolução colaborativa de problemas`
  String get skillTeamworkExample3 {
    return Intl.message(
      'Resolução colaborativa de problemas',
      name: 'skillTeamworkExample3',
      desc: '',
      args: [],
    );
  }

  /// `Comunicação eficaz com stakeholders`
  String get skillTeamworkExample4 {
    return Intl.message(
      'Comunicação eficaz com stakeholders',
      name: 'skillTeamworkExample4',
      desc: '',
      args: [],
    );
  }

  /// `Participação em reuniões de feedback`
  String get skillTeamworkExample5 {
    return Intl.message(
      'Participação em reuniões de feedback',
      name: 'skillTeamworkExample5',
      desc: '',
      args: [],
    );
  }

  /// `Resolução de Problemas`
  String get skillProblemSolvingName {
    return Intl.message(
      'Resolução de Problemas',
      name: 'skillProblemSolvingName',
      desc: '',
      args: [],
    );
  }

  /// `Análise e solução de problemas complexos`
  String get skillProblemSolvingDescription {
    return Intl.message(
      'Análise e solução de problemas complexos',
      name: 'skillProblemSolvingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Debug de aplicações em produção`
  String get skillProblemSolvingExample1 {
    return Intl.message(
      'Debug de aplicações em produção',
      name: 'skillProblemSolvingExample1',
      desc: '',
      args: [],
    );
  }

  /// `Otimização de performance`
  String get skillProblemSolvingExample2 {
    return Intl.message(
      'Otimização de performance',
      name: 'skillProblemSolvingExample2',
      desc: '',
      args: [],
    );
  }

  /// `Implementação de soluções criativas`
  String get skillProblemSolvingExample3 {
    return Intl.message(
      'Implementação de soluções criativas',
      name: 'skillProblemSolvingExample3',
      desc: '',
      args: [],
    );
  }

  /// `Atendimento de chamados de suporte`
  String get skillProblemSolvingExample4 {
    return Intl.message(
      'Atendimento de chamados de suporte',
      name: 'skillProblemSolvingExample4',
      desc: '',
      args: [],
    );
  }

  /// `Capacidade Analítica`
  String get skillAnalyticalAbilityName {
    return Intl.message(
      'Capacidade Analítica',
      name: 'skillAnalyticalAbilityName',
      desc: '',
      args: [],
    );
  }

  /// `Prevenção de problemas e foco em soluções eficientes`
  String get skillAnalyticalAbilityDescription {
    return Intl.message(
      'Prevenção de problemas e foco em soluções eficientes',
      name: 'skillAnalyticalAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Análise de possíveis problemas no código`
  String get skillAnalyticalAbilityExample1 {
    return Intl.message(
      'Análise de possíveis problemas no código',
      name: 'skillAnalyticalAbilityExample1',
      desc: '',
      args: [],
    );
  }

  /// `Refatoração de código desnecessariamente complexo`
  String get skillAnalyticalAbilityExample2 {
    return Intl.message(
      'Refatoração de código desnecessariamente complexo',
      name: 'skillAnalyticalAbilityExample2',
      desc: '',
      args: [],
    );
  }

  /// `Análise de requisitos detalhada para evitar retrabalho ou divergências nas regras de negócio`
  String get skillAnalyticalAbilityExample3 {
    return Intl.message(
      'Análise de requisitos detalhada para evitar retrabalho ou divergências nas regras de negócio',
      name: 'skillAnalyticalAbilityExample3',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao carregar dados do currículo.`
  String get notificationErrorLoadData {
    return Intl.message(
      'Erro ao carregar dados do currículo.',
      name: 'notificationErrorLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao selecionar filtro.`
  String get notificationErrorSelectFilter {
    return Intl.message(
      'Erro ao selecionar filtro.',
      name: 'notificationErrorSelectFilter',
      desc: '',
      args: [],
    );
  }

  /// `PDF gerado com sucesso.`
  String get notificationSuccessGeneratePdf {
    return Intl.message(
      'PDF gerado com sucesso.',
      name: 'notificationSuccessGeneratePdf',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao gerar PDF.`
  String get notificationErrorGeneratePdf {
    return Intl.message(
      'Erro ao gerar PDF.',
      name: 'notificationErrorGeneratePdf',
      desc: '',
      args: [],
    );
  }

  /// `Erro ao abrir contato: URL não encontrada. ({url})`
  String notificationErrorOpenContact(String url) {
    return Intl.message(
      'Erro ao abrir contato: URL não encontrada. ($url)',
      name: 'notificationErrorOpenContact',
      desc: '',
      args: [url],
    );
  }

  /// `Erro ao navegar: URL não encontrada. ({url})`
  String notificationErrorOpenUrl(String url) {
    return Intl.message(
      'Erro ao navegar: URL não encontrada. ($url)',
      name: 'notificationErrorOpenUrl',
      desc: '',
      args: [url],
    );
  }

  /// `Erro ao carregar tema.`
  String get notificationErrorLoadTheme {
    return Intl.message(
      'Erro ao carregar tema.',
      name: 'notificationErrorLoadTheme',
      desc: '',
      args: [],
    );
  }

  /// `Tema alterado para {themeName}.`
  String notificationSuccessToggleTheme(String themeName) {
    return Intl.message(
      'Tema alterado para $themeName.',
      name: 'notificationSuccessToggleTheme',
      desc: '',
      args: [themeName],
    );
  }

  /// `Erro ao alterar tema.`
  String get notificationErrorToggleTheme {
    return Intl.message(
      'Erro ao alterar tema.',
      name: 'notificationErrorToggleTheme',
      desc: '',
      args: [],
    );
  }

  /// `Language changed to {languageCode}.`
  String notificationSuccessToggleLanguage(String languageCode) {
    return Intl.message(
      'Language changed to $languageCode.',
      name: 'notificationSuccessToggleLanguage',
      desc: '',
      args: [languageCode],
    );
  }

  /// `Erro ao alterar idioma.`
  String get notificationErrorToggleLanguage {
    return Intl.message(
      'Erro ao alterar idioma.',
      name: 'notificationErrorToggleLanguage',
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
