import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/widget/tech_chip.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    return Builder(
      builder: (context) {
        final mainTechnologies = curriculum.technicalSkills.take(6).toList();

        if (mainTechnologies.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).mainTechnologies,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Wrap(
              runSpacing: 12,
              spacing: 12,
              children: mainTechnologies.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;

                return ResponsiveRowColumnItem(
                  child: TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 800 + (index * 100)),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: TechChip(tech: skill.name),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
