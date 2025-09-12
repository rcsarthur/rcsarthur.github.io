import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/widget/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).skills,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).skillsDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
          ),
          const SizedBox(height: 32),
          AnimatedBuilder(
            animation: curriculum,
            builder: (context, child) {
              if (curriculum.executing) {
                return const Center(child: CircularProgressIndicator());
              }

              if (curriculum.error != null) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        curriculum.error!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          curriculum.clearError();
                          curriculum.loadCurriculumData();
                        },
                        child: Text(
                          S.of(context).tryAgain,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Technical Skills Section
                  if (curriculum.technicalSkills.isNotEmpty) ...[
                    Text(
                      S.of(context).technicalSkills,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ResponsiveRowColumn(
                      layout: isSmallScreen ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: [
                        ...curriculum.technicalSkills.map((skill) {
                          return ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: SkillCard(skill: skill),
                          );
                        })
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Soft Skills Section
                  if (curriculum.softSkills.isNotEmpty) ...[
                    Text(
                      S.of(context).softSkills,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ResponsiveRowColumn(
                      layout: isSmallScreen ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: curriculum.softSkills.map((skill) {
                        return ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: SkillCard(skill: skill),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
