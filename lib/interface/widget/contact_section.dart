import 'package:curriculum_dart/domain/entities/contact_info.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:curriculum_flutter/interface/view_model/curriculum.view_model.dart';
import 'package:curriculum_flutter/interface/view_model/provider/view_model_provider.dart';
import 'package:curriculum_flutter/interface/view_model/theme.view_model.dart';
import 'package:curriculum_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final curriculum = context.curriculumViewModel;
    final theme = context.themeViewModel;

    return Builder(
      builder: (context) {
        if (curriculum.contactInfo.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).contactMe,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.ROW,
              rowSpacing: 16,
              columnSpacing: 16,
              children: curriculum.contactInfo.map((contact) {
                return ResponsiveRowColumnItem(
                  child: _buildContactButton(context, contact, curriculum, theme),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactButton(BuildContext context, ContactInfo contact, CurriculumViewModel curriculumViewModel,
      ThemeViewModel themeViewModel) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1.0, end: 1.0),
      builder: (context, scale, child) {
        return Tooltip(
          message: _getTooltipMessage(context, contact.type.value),
          child: MouseRegion(
            child: InkWell(
              onTap: () => curriculumViewModel.openContact(contact),
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()..scaledByDouble(scale, scale, scale, 1),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.getCustomColor(contact.type.value, themeViewModel.themeSettings.themeMode),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.getCustomColor(contact.type.value, themeViewModel.themeSettings.themeMode)
                            .withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _getContactIcon(contact.type.value),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getContactIcon(String type) {
    switch (type.toLowerCase()) {
      case 'email':
        return Icons.email_outlined;
      case 'whatsapp':
        return FontAwesomeIcons.whatsapp;
      case 'linkedin':
        return FontAwesomeIcons.linkedinIn;
      case 'github':
        return FontAwesomeIcons.githubAlt;
      default:
        return Icons.link;
    }
  }

  String _getTooltipMessage(BuildContext context, String type) {
    switch (type.toLowerCase()) {
      case 'email':
        return S.of(context).contactTooltipEmail;
      case 'whatsapp':
        return S.of(context).contactTooltipWhatsapp;
      case 'linkedin':
        return S.of(context).contactTooltipLinkedin;
      case 'github':
        return S.of(context).contactTooltipGithub;
      default:
        return S.of(context).contact;
    }
  }
}
