import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/domain/enums/languages.enum.dart';
import 'package:curriculum_dart/domain/enums/skill.enum.dart';
import 'package:curriculum_dart/service/pdf.service.dart';
import 'package:curriculum_flutter/generated/assets.dart';
import 'package:curriculum_flutter/generated/l10n.dart' show S;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class FlutterPdfService implements PdfService {
  static FlutterPdfService? _instancia;

  FlutterPdfService._();

  static FlutterPdfService get instance {
    _instancia ??= FlutterPdfService._();
    return _instancia!;
  }

  @override
  Future<List<int>> generateCurriculumPdf({
    required PersonalInfo personalInfo,
    required List<Experience> experiences,
    required List<Project> projects,
    required List<Skill> skills,
    required Languages language,
  }) async {
    final pdf = pw.Document();
    final fontRegular = await rootBundle.load(Assets.fontsOpenSansRegular);
    final fontBold = await rootBundle.load(Assets.fontsOpenSansBold);
    final fontItalic = await rootBundle.load(Assets.fontsOpenSansItalic);
    final fontBoldItalic = await rootBundle.load(Assets.fontsOpenSansBoldItalic);
    final emojiFontData = await rootBundle.load(Assets.fontsNotoColorEmoji);
    final ttfRegular = pw.Font.ttf(fontRegular);
    final ttfBold = pw.Font.ttf(fontBold);
    final ttfItalic = pw.Font.ttf(fontItalic);
    final ttfBoldItalic = pw.Font.ttf(fontBoldItalic);
    final emojiTtf = pw.Font.ttf(emojiFontData);
    final theme = pw.ThemeData.withFont(
      base: ttfRegular,
      bold: ttfBold,
      italic: ttfItalic,
      boldItalic: ttfBoldItalic,
      fontFallback: [emojiTtf],
    );
    pdf.addPage(
      pw.MultiPage(
        theme: theme,
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(personalInfo, emojiTtf),
            pw.SizedBox(height: 20),
            _buildSummary(personalInfo),
            pw.SizedBox(height: 20),
            _buildExperiences(experiences, language),
            pw.SizedBox(height: 20),
            _buildProjects(projects),
            pw.SizedBox(height: 20),
            _buildSkills(skills),
          ];
        },
      ),
    );

    return await pdf.save();
  }

  @override
  Future<void> downloadPdf(List<int> pdfBytes, String fileName) async {
    await Printing.sharePdf(
      bytes: Uint8List.fromList(pdfBytes),
      filename: fileName,
    );
  }

  pw.Widget _buildHeader(PersonalInfo personalInfo, pw.Font emoji) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          personalInfo.name,
          style: pw.TextStyle(
            fontSize: 28,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          personalInfo.title,
          style: const pw.TextStyle(
            fontSize: 18,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 12),
        pw.Row(
          children: [
            pw.Text(
              '📧 ${personalInfo.email}',
              style: pw.TextStyle(fontFallback: [emoji]),
            ),
            pw.SizedBox(width: 20),
            pw.Text(
              '📱 ${personalInfo.phone}',
              style: pw.TextStyle(fontFallback: [emoji]),
            ),
            pw.SizedBox(width: 20),
            pw.Text(
              '📍 ${personalInfo.location}',
              style: pw.TextStyle(fontFallback: [emoji]),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildSummary(PersonalInfo personalInfo) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          S.current.professionalSummary,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          personalInfo.summary,
          style: const pw.TextStyle(fontSize: 12),
          textAlign: pw.TextAlign.justify,
        ),
      ],
    );
  }

  pw.Widget _buildExperiences(List<Experience> experiences, Languages language) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          S.current.professionalExperience,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 12),
        ...experiences.map((exp) => _buildExperienceItem(exp, language)),
      ],
    );
  }

  pw.Widget _buildExperienceItem(Experience experience, Languages language) {
    final period = experience.isCurrentJob
        ? '${experience.formattedStartDate(language.code)} - ${S.current.present}'
        : '${experience.formattedStartDate(language.code)} - ${experience.formattedEndDate(language.code) ?? ''}';

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 16),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            experience.position,
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            '${experience.company} • $period',
            style: const pw.TextStyle(
              fontSize: 12,
              color: PdfColors.grey700,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            experience.description,
            style: const pw.TextStyle(fontSize: 11),
          ),
          if (experience.technologies.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            pw.Text(
              '${S.current.technologies}: ${experience.technologies.join(', ')}',
              style: pw.TextStyle(
                fontSize: 10,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  pw.Widget _buildProjects(List<Project> projects) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          S.current.projects,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 12),
        ...projects.take(3).map((project) => _buildProjectItem(project)),
      ],
    );
  }

  pw.Widget _buildProjectItem(Project project) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            project.name,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            project.description,
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            '${S.current.technologies}: ${project.technologies.join(', ')}',
            style: pw.TextStyle(
              fontSize: 9,
              fontStyle: pw.FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSkills(List<Skill> skills) {
    final technicalSkills = skills.where((s) => s.type == SkillType.technical).toList();
    final softSkills = skills.where((s) => s.type == SkillType.soft).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          S.current.skills,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 12),
        if (technicalSkills.isNotEmpty) ...[
          pw.Text(
            S.current.technicalSkills,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            technicalSkills.map((s) => s.name).join(' • '),
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.SizedBox(height: 8),
        ],
        if (softSkills.isNotEmpty) ...[
          pw.Text(
            S.current.softSkills,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            softSkills.map((s) => s.name).join(' • '),
            style: const pw.TextStyle(fontSize: 10),
          ),
        ],
      ],
    );
  }
}
