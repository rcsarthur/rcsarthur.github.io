import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class TechChip extends StatelessWidget {
  final String tech;
  final bool isSelected;
  final VoidCallback? onTap;

  const TechChip({
    super.key,
    required this.tech,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.themeViewModel;
    final color = AppTheme.getCustomColor(tech, theme.themeSettings.themeMode);

    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? color : color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: color,
              width: 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            tech,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected ? Colors.white : color,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
