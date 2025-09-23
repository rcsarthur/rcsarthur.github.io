import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavigationSection extends StatelessWidget {
  const NavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        ResponsiveRowColumn(
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          layout: isSmallScreen ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
          rowSpacing: 16,
          columnSpacing: 16,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: _buildNavigationCard(
                context,
                title: S.of(context).experiences,
                description: S.of(context).experienceDescription,
                icon: Icons.work_outline_rounded,
                route: Routes.experiences,
                color: Colors.blue,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: _buildNavigationCard(
                context,
                title: S.of(context).projects,
                description: S.of(context).projectsDescription,
                icon: Icons.app_shortcut_outlined,
                route: Routes.projects,
                color: Colors.green,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: _buildNavigationCard(
                context,
                title: S.of(context).skills,
                description: S.of(context).skillsDescription,
                icon: Icons.star_border_rounded,
                route: Routes.skills,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Routes route,
    required Color color,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1.0, end: 1.0),
      builder: (context, scale, child) {
        return InkWell(
          onTap: () => Routes.navigate(context, route),
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()..scaleByDouble(scale, scale, scale, 1),
            child: Card(
              elevation: 4,
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color.withValues(alpha: 0.1),
                        color.withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              S.of(context).explore,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: color,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
