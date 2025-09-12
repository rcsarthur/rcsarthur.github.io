import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/views/projects.view.dart';
import 'package:curriculum_flutter/interface/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(body: SafeArea(child: ProjectsView()));
  }
}
