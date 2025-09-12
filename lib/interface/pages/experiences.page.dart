import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/views/experiences.view.dart';
import 'package:curriculum_flutter/interface/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(body: SafeArea(child: ExperiencesView()));
  }
}
