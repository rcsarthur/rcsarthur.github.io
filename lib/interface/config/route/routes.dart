import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/config/module/app_router.dart';
import 'package:curriculum_flutter/interface/config/route/router_constants.dart';
import 'package:flutter/material.dart';

enum Routes {
  home(homeRoute),
  experiences(experiencesRoute),
  projects(projectsRoute),
  projectDetail('$projectsRoute/:projectId'),
  skills(skillsRoute);

  PageInfo get _page => switch (this) {
        Routes.home => HomeRoute.page,
        Routes.experiences => ExperiencesRoute.page,
        Routes.projects => ProjectsRoute.page,
        Routes.projectDetail => ProjectDetailRoute.page,
        Routes.skills => SkillsRoute.page,
      };

  static List<AutoRoute> get map => [
        _add(Routes.home, initial: true),
        _add(Routes.experiences),
        _add(Routes.projects),
        _add(Routes.projectDetail),
        _add(Routes.skills),
      ];

  PageRouteInfo info([String? arg]) => switch (this) {
        Routes.home => const HomeRoute(),
        Routes.experiences => const ExperiencesRoute(),
        Routes.projects => const ProjectsRoute(),
        Routes.skills => const SkillsRoute(),
        Routes.projectDetail => ProjectDetailRoute(projectId: arg ?? ''),
      };

  const Routes(this.url);

  final String url;
  static String _current = Routes.home.name;

  static String get current => _current;

  static final Map<Routes, PageInfo> _allRoutes = _registerAll();

  static Map<Routes, PageInfo> _registerAll() {
    Map<Routes, PageInfo> mapa = {};
    for (final rota in Routes.values) {
      mapa.addAll({rota: rota._page});
    }
    return mapa;
  }

  static void navigate(BuildContext context, Routes route) {
    AutoRouter.of(context).navigatePath(route.url);
    _current = route.name;
  }

  static void navigateWithArgs(BuildContext context, Routes route, [String? arg]) {
    AutoRouter.of(context).navigate(route.info(arg));
    _current = route.name;
  }

  static void pushWithArgs(BuildContext context, Routes route, [String? arg]) {
    AutoRouter.of(context).push(route.info(arg));
    _current = route.name;
  }

  static void replaceWithArgs(BuildContext context, Routes route, [String? arg]) {
    AutoRouter.of(context).replace(route.info(arg));
    _current = route.name;
  }

  static AutoRoute _add(
    Routes route, {
    List<AutoRoute>? subroutes,
    AutoRouteGuard? guard,
    bool initial = false,
    bool maintainState = false,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition =
        TransitionsBuilders.slideLeftWithFade,
  }) {
    List<AutoRouteGuard> guards = guard != null ? [guard] : [];
    return CustomRoute(
      page: _allRoutes[route]!,
      path: route.url,
      initial: initial,
      guards: guards,
      children: subroutes,
      maintainState: maintainState,
      transitionsBuilder: transition,
    );
  }
}
