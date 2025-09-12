import 'package:auto_route/auto_route.dart';
import 'package:curriculum_flutter/interface/views/home.view.dart';
import 'package:curriculum_flutter/interface/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(body: SafeArea(child: HomeView()));
  }
}
