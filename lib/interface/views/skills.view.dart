import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/extensions/list_chunk.extension.dart';
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/widget/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
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
                  if (curriculum.technicalSkills.isNotEmpty) ...[
                    Text(
                      S.of(context).technicalSkills,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildSkillsGrid(
                      context: context,
                      skills: curriculum.technicalSkills,
                    ),
                    const SizedBox(height: 32),
                  ],
                  if (curriculum.softSkills.isNotEmpty) ...[
                    Text(
                      S.of(context).softSkills,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildSkillsGrid(
                      context: context,
                      skills: curriculum.softSkills,
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

  Widget _buildSkillsGrid({
    required BuildContext context,
    required List<Skill> skills,
  }) {
    final skillChunks = skills.chunk(3);

    return Column(
      children: skillChunks.map((chunk) {
        final int placeholderCount = 3 - chunk.length;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            rowSpacing: 16,
            columnSpacing: 16,
            children: [
              ...chunk.map((skill) {
                return ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: SkillCard(skill: skill),
                );
              }),
              if (placeholderCount > 0)
                ...List.generate(placeholderCount, (_) {
                  return const ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SizedBox.shrink(),
                  );
                }),
            ],
          ),
        );
      }).toList(),
    );
  }
}
