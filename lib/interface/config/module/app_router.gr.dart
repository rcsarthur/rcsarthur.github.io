// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ExperiencesPage]
class ExperiencesRoute extends PageRouteInfo<void> {
  const ExperiencesRoute({List<PageRouteInfo>? children}) : super(ExperiencesRoute.name, initialChildren: children);

  static const String name = 'ExperiencesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExperiencesPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children}) : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [ProjectDetailPage]
class ProjectDetailRoute extends PageRouteInfo<ProjectDetailRouteArgs> {
  ProjectDetailRoute({
    Key? key,
    required String projectId,
    List<PageRouteInfo>? children,
  }) : super(
          ProjectDetailRoute.name,
          args: ProjectDetailRouteArgs(key: key, projectId: projectId),
          rawPathParams: {'projectId': projectId},
          initialChildren: children,
        );

  static const String name = 'ProjectDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProjectDetailRouteArgs>(
        orElse: () => ProjectDetailRouteArgs(
          projectId: pathParams.getString('projectId'),
        ),
      );
      return ProjectDetailPage(key: args.key, projectId: args.projectId);
    },
  );
}

class ProjectDetailRouteArgs {
  const ProjectDetailRouteArgs({this.key, required this.projectId});

  final Key? key;

  final String projectId;

  @override
  String toString() {
    return 'ProjectDetailRouteArgs{key: $key, projectId: $projectId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectDetailRouteArgs) return false;
    return key == other.key && projectId == other.projectId;
  }

  @override
  int get hashCode => key.hashCode ^ projectId.hashCode;
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children}) : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsPage();
    },
  );
}

/// generated route for
/// [SkillsPage]
class SkillsRoute extends PageRouteInfo<void> {
  const SkillsRoute({List<PageRouteInfo>? children}) : super(SkillsRoute.name, initialChildren: children);

  static const String name = 'SkillsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SkillsPage();
    },
  );
}
