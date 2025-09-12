import 'package:curriculum_dart/domain/entities/languages.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/config/extensions/languages.extension.dart';
import 'package:curriculum_flutter/interface/config/route/routes.dart';
import 'package:curriculum_flutter/interface/view_model/curriculum.view_model.dart';
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/view_model/theme.view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    final theme = context.themeViewModel;
    final isSmallScreen = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Scaffold(
      appBar: _buildAppBar(context, curriculum, theme, isSmallScreen),
      drawer: isSmallScreen ? _buildDrawer(context, curriculum, theme) : null,
      body: body,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, CurriculumViewModel curriculumViewModel,
      ThemeViewModel themeViewModel, bool isSmallScreen) {
    return AppBar(
      title: InkWell(
        onTap: () {
          if (Routes.current == Routes.home.name) return;
          Routes.replaceWithArgs(context, Routes.home);
        },
        onDoubleTap: () => themeViewModel.playAudio('audio/poppy.wav'),
        borderRadius: BorderRadius.circular(4),
        child: Text(S.of(context).appTitle),
      ),
      automaticallyImplyLeading: isSmallScreen,
      titleSpacing: 8,
      actions: [
        if (!isSmallScreen)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  _buildNavButton(context, S.of(context).home, Routes.home, Icons.home_outlined),
                  _buildNavButton(context, S.of(context).experiences, Routes.experiences, Icons.work_outline_rounded),
                  _buildNavButton(context, S.of(context).projects, Routes.projects, Icons.app_shortcut_outlined),
                  _buildNavButton(context, S.of(context).skills, Routes.skills, Icons.star_border_rounded),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),

        // Language toggle
        AnimatedBuilder(
          animation: themeViewModel,
          builder: (context, child) {
            return IconButton(
              onPressed: () {
                final newLanguage =
                    Languages.values.firstWhere((lang) => lang != themeViewModel.themeSettings.language);
                themeViewModel.changeLanguage(newLanguage);
                curriculumViewModel.loadCurriculumData();
              },
              icon: SvgPicture.asset(
                themeViewModel.themeSettings.language.oppositeFlag,
                width: 24,
                height: 24,
              ),
              tooltip: S.of(context).changeLanguage,
            );
          },
        ),

        // Theme toggle
        AnimatedBuilder(
          animation: themeViewModel,
          builder: (context, child) {
            return IconButton(
              onPressed: themeViewModel.toggleTheme,
              icon: Icon(
                themeViewModel.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              ),
              tooltip: S.of(context).toggleTheme,
            );
          },
        ),

        // PDF download
        IconButton(
          onPressed: () => curriculumViewModel.generatePdf(themeViewModel.themeSettings.language),
          icon: const Icon(Icons.download),
          tooltip: S.of(context).downloadPdf,
        ),

        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String label, Routes route, IconData icon) {
    final isActive = Routes.current == route.url;

    return TextButton.icon(
      onPressed: () => Routes.navigate(context, route),
      icon: Icon(
        icon,
        size: 18,
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, CurriculumViewModel curriculumViewModel, ThemeViewModel themeViewModel) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).appTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                AnimatedBuilder(
                  animation: curriculumViewModel,
                  builder: (context, child) {
                    return Text(
                      curriculumViewModel.personalInfo?.name ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, S.of(context).home, Routes.home, Icons.home_outlined),
          _buildDrawerItem(context, S.of(context).experiences, Routes.experiences, Icons.work_outline_rounded),
          _buildDrawerItem(context, S.of(context).projects, Routes.projects, Icons.app_shortcut_outlined),
          _buildDrawerItem(context, S.of(context).skills, Routes.skills, Icons.star_border_rounded),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(S.of(context).downloadPdf),
            onTap: () {
              Navigator.pop(context);
              curriculumViewModel.generatePdf(themeViewModel.themeSettings.language);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, Routes route, IconData icon) {
    final isActive = Routes.current == route.url;

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Theme.of(context).colorScheme.primary : null,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isActive,
      onTap: () {
        Routes.replaceWithArgs(context, route);
      },
    );
  }
}
