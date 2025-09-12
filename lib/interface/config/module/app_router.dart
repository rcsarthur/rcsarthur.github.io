import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/config/route/routes.dart';
import 'package:curriculum_flutter/interface/pages/experiences.page.dart';
import 'package:curriculum_flutter/interface/pages/home.page.dart';
import 'package:curriculum_flutter/interface/pages/project_detail.page.dart';
import 'package:curriculum_flutter/interface/pages/projects.page.dart';
import 'package:curriculum_flutter/interface/pages/skills.page.dart';
import 'package:flutter/foundation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => Routes.map;
}
