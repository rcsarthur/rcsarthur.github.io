import 'package:curriculum_flutter/interface/widget/contact_section.dart';
import 'package:curriculum_flutter/interface/widget/hero_section.dart';
import 'package:curriculum_flutter/interface/widget/navigation_section.dart';
import 'package:curriculum_flutter/interface/widget/tech_stack_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroSection(),
          SizedBox(height: 32),
          ContactSection(),
          SizedBox(height: 32),
          TechStackSection(),
          SizedBox(height: 32),
          NavigationSection(),
        ],
      ),
    );
  }
}
