import 'package:auto_route/auto_route.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/view_model/theme.view_model.dart';
import 'package:curriculum_flutter/interface/widget/tech_chip.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectDetailView extends StatelessWidget {
  final String projectId;

  const ProjectDetailView({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    final theme = context.themeViewModel;
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return AnimatedBuilder(
      animation: curriculum,
      builder: (context, child) {
        if (curriculum.executing) return const Center(child: CircularProgressIndicator());
        final project = curriculum.projects.where((p) => p.id == projectId).firstOrNull;
        if (project == null) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).projectNotFound,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.router.maybePop(),
                    child: Text(
                      S.of(context).goBack,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ResponsiveRowColumn(
            layout: isSmallScreen ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
            rowSpacing: 32,
            columnSpacing: 32,
            rowMainAxisAlignment: MainAxisAlignment.start,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isSmallScreen)
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildProjectImage(context, project),
                ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _buildProjectInfo(context, project, theme),
              ),
              if (!isSmallScreen)
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildProjectImage(context, project),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectInfo(BuildContext context, Project project, ThemeViewModel themeViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (project.iconUrl != null) ...[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: Icon(
                  Icons.app_shortcut_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    _getStatusText(context, project.status),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: _getStatusColor(project.status, context),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          S.of(context).description,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Text(
          S.of(context).technologies,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies.map((tech) => TechChip(tech: tech)).toList(),
        ),
        const SizedBox(height: 24),
        Text(
          S.of(context).features,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...project.features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => context.router.maybePop(),
              icon: const Icon(Icons.arrow_back_ios_rounded),
              label: Text(
                S.of(context).goBack,
              ),
            ),
            if (project.githubUrl != null || project.liveUrl != null) ...[
              const SizedBox(width: 16),
              if (project.githubUrl != null)
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implementar abertura do GitHub
                  },
                  icon: const Icon(Icons.code_rounded),
                  label: Text(
                    S.of(context).sourceCode,
                  ),
                ),
              if (project.liveUrl != null) ...[
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implementar abertura do link
                  },
                  icon: const Icon(Icons.launch_rounded),
                  label: Text(
                    S.of(context).viewProject,
                  ),
                ),
              ],
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildProjectImage(BuildContext context, Project project) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: project.imageUrl == null
          ? const Icon(Icons.image_outlined, size: 64, color: Colors.grey)
          : Image.network(
              project.imageUrl!,
              width: 64,
              height: 64,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_outlined, size: 64, color: Colors.grey),
            ),
    );
  }

  String _getStatusText(BuildContext context, ProjectStatus status) {
    switch (status) {
      case ProjectStatus.inProgress:
        return S.of(context).projectStatusInProgress;
      case ProjectStatus.completed:
        return S.of(context).projectStatusCompleted;
      case ProjectStatus.paused:
        return S.of(context).projectStatusPaused;
      case ProjectStatus.cancelled:
        return S.of(context).projectStatusCancelled;
    }
  }

  Color _getStatusColor(ProjectStatus status, BuildContext context) {
    switch (status) {
      case ProjectStatus.inProgress:
        return Colors.blue;
      case ProjectStatus.completed:
        return Colors.green;
      case ProjectStatus.paused:
        return Colors.orange;
      case ProjectStatus.cancelled:
        return Colors.red;
    }
  }
}
