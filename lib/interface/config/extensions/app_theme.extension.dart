import 'package:curriculum_flutter/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension AppThemeExtensions on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
