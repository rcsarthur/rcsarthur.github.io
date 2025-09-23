import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/extensions/list_chunk.extension.dart';
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).projects,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).projectsDescription,
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

                    final projectChunks = curriculum.projects.chunk(3);

                    return Column(
                      children: projectChunks.map((chunk) {
                        final int placeholderCount = 3 - chunk.length;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: ResponsiveRowColumn(
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            rowSpacing: 24,
                            columnSpacing: 24,
                            children: [
                              ...chunk.map((project) {
                                return ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: ProjectCard(project: project),
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
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
