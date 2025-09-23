import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/enums/project.enum.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/route/routes.dart';
import 'package:curriculum_flutter/interface/widget/tech_chip.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => Routes.navigateWithArgs(context, Routes.projectDetail, project.id),
        borderRadius: BorderRadius.circular(8),
        child: Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(project.iconUrl!),
                      ),
                    ] else ...[
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
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            _getStatusText(context, project.status),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: _getStatusColor(project.status),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                // Technologies
                if (project.technologies.isNotEmpty) ...[
                  Text(
                    S.of(context).technologies,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.take(4).map((tech) => TechChip(tech: tech)).toList(),
                  ),
                  if (project.technologies.length > 4)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '+${project.technologies.length - 4} ${S.of(context).more}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],

                // Features preview
                if (project.features.isNotEmpty) ...[
                  Text(
                    S.of(context).features,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...project.features.take(3).map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              size: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )),
                  if (project.features.length > 3)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '+${project.features.length - 3} ${S.of(context).moreFeatures}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],

                Row(
                  children: [
                    Text(
                      S.of(context).projectDetails,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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

  Color _getStatusColor(ProjectStatus status) {
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
