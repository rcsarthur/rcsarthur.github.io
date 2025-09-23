import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;

    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    return Builder(
      builder: (context) {
        final personalInfo = curriculum.personalInfo;
        if (personalInfo == null) {
          return const SizedBox.shrink();
        }
        return ResponsiveRowColumn(
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          layout: isSmallScreen ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
          rowSpacing: 32,
          columnSpacing: 24,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1800),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 0.8 + (0.2 * value),
                    child: Opacity(
                      opacity: value,
                      child: Container(
                        width: isSmallScreen ? 200 : 300,
                        height: isSmallScreen ? 200 : 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(personalInfo.profileImageUrl, width: 120),
                      ),
                    ),
                  );
                },
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1000),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Text(
                            personalInfo.name,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1200),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Text(
                            personalInfo.title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1400),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Text(
                            personalInfo.summary,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  height: 1.6,
                                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1600),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                personalInfo.location,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
