import 'dart:typed_data';

import 'package:curriculum_dart/domain/entities/experience.dart';
import 'package:curriculum_dart/domain/entities/languages.dart';
import 'package:curriculum_dart/domain/entities/personal_info.dart';
import 'package:curriculum_dart/domain/entities/project.dart';
import 'package:curriculum_dart/domain/entities/skill.dart';
import 'package:curriculum_dart/service/pdf.service.dart';
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
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            _buildHeader(personalInfo, language, emoji),
            pw.SizedBox(height: 20),
            _buildSummary(personalInfo, language),
            pw.SizedBox(height: 20),
            _buildExperiences(experiences, language),
            pw.SizedBox(height: 20),
            _buildProjects(projects, language),
            pw.SizedBox(height: 20),
            _buildSkills(skills, language),
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

  pw.Widget _buildHeader(PersonalInfo personalInfo, Languages language, pw.Font emoji) {
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

  pw.Widget _buildSummary(PersonalInfo personalInfo, Languages language) {
    final title = language == Languages.portuguese ? 'Resumo Profissional' : 'Professional Summary';

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
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
    final title = language == Languages.portuguese ? 'Experiência Profissional' : 'Professional Experience';

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
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
        ? '${experience.formattedStartDate(language.code)} - ${language == Languages.portuguese ? 'Atual' : 'Present'}'
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
              '${language == Languages.portuguese ? 'Tecnologias' : 'Technologies'}: ${experience.technologies.join(', ')}',
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

  pw.Widget _buildProjects(List<Project> projects, Languages language) {
    final title = language == Languages.portuguese ? 'Projetos' : 'Projects';

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 12),
        ...projects.take(3).map((project) => _buildProjectItem(project, language)),
      ],
    );
  }

  pw.Widget _buildProjectItem(Project project, Languages language) {
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
            '${language == Languages.portuguese ? 'Tecnologias' : 'Technologies'}: ${project.technologies.join(', ')}',
            style: pw.TextStyle(
              fontSize: 9,
              fontStyle: pw.FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSkills(List<Skill> skills, Languages language) {
    final title = language == Languages.portuguese ? 'Habilidades' : 'Skills';
    final technicalSkills = skills.where((s) => s.type == SkillType.technical).toList();
    final softSkills = skills.where((s) => s.type == SkillType.soft).toList();

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 12),
        if (technicalSkills.isNotEmpty) ...[
          pw.Text(
            language == Languages.portuguese ? 'Habilidades Técnicas' : 'Technical Skills',
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
            language == Languages.portuguese ? 'Soft Skills' : 'Soft Skills',
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
