import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and level
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (skill.iconUrl != null) ...[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    child: Icon(
                      _getSkillIcon(skill.type),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skill.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        _getSkillTypeText(context, skill.type),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
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
              skill.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
            ),

            const SizedBox(height: 16),

            // Level indicator
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).skillLevel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: _getLevelProgress(skill.level),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(_getLevelColor(skill.level)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getLevelColor(skill.level).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getLevelText(context, skill.level),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getLevelColor(skill.level),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Examples
            if (skill.examples.isNotEmpty) ...[
              Text(
                S.of(context).examples,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ...skill.examples.map((example) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_right,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            example,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getSkillIcon(SkillType type) {
    switch (type) {
      case SkillType.technical:
        return Icons.code;
      case SkillType.soft:
        return Icons.psychology;
      case SkillType.language:
        return Icons.language;
    }
  }

  String _getSkillTypeText(BuildContext context, SkillType type) {
    switch (type) {
      case SkillType.technical:
        return S.of(context).skillTypeTechnical;
      case SkillType.soft:
        return S().skillTypeSoft;
      case SkillType.language:
        return S().skillTypeLanguage;
    }
  }

  String _getLevelText(BuildContext context, SkillLevel level) {
    switch (level) {
      case SkillLevel.beginner:
        return S.of(context).skillLevelBeginner;
      case SkillLevel.intermediate:
        return S.of(context).skillLevelIntermediate;
      case SkillLevel.advanced:
        return S.of(context).skillLevelAdvanced;
      case SkillLevel.expert:
        return S.of(context).skillLevelExpert;
    }
  }

  Color _getLevelColor(SkillLevel level) {
    switch (level) {
      case SkillLevel.beginner:
        return Colors.orange;
      case SkillLevel.intermediate:
        return Colors.blue;
      case SkillLevel.advanced:
        return Colors.green;
      case SkillLevel.expert:
        return Colors.purple;
    }
  }

  double _getLevelProgress(SkillLevel level) {
    switch (level) {
      case SkillLevel.beginner:
        return 0.25;
      case SkillLevel.intermediate:
        return 0.5;
      case SkillLevel.advanced:
        return 0.75;
      case SkillLevel.expert:
        return 1.0;
    }
  }
}
