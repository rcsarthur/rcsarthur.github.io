import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/views/project_detail.view.dart';
import 'package:curriculum_flutter/interface/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectDetailPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailPage({
    super.key,
    @PathParam('projectId') required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: SafeArea(child: ProjectDetailView(projectId: projectId)));
  }
}
