import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import '../config/assets_path.dart';
import '../models/education.dart';
import '../models/project.dart';
import '../models/skills.dart';
import '../models/user_details.dart';

class ResumePDF extends StatelessWidget {
  final UserDetails userDetails;
  final List<Project> projects;
  final List<Education> education;
  final List<SkillCategory> skills;

  const ResumePDF({
    super.key,
    required this.userDetails,
    required this.projects,
    required this.education,
    required this.skills,
  });

  // Load image from asset or file
  Future<pw.ImageProvider> loadImage() async {
    final byteData = await rootBundle.load(ImagePath.picture);
    final imageBytes = byteData.buffer.asUint8List();
    return pw.MemoryImage(imageBytes);
  }
  Future<pw.ImageProvider> loadBackground() async {
    final byteData = await rootBundle.load(ImagePath.background);
    final imageBytes = byteData.buffer.asUint8List();
    return pw.MemoryImage(imageBytes);
  }

  Future<Uint8List> _createResumePdf() async {
    final imageProvider = await loadImage();
    final backgroundProvider = await loadBackground();
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Container(
            padding: pw.EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: backgroundProvider,
                ),
              ),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Top Portion
                  pw.Row(
                    children: [
                      // Image and details
                      pw.Expanded(
                        flex: 1,
                        child: pw.Column(
                          children: [
                            pw.ClipRRect(
                              horizontalRadius: 35,
                              verticalRadius: 35,
                              child: pw.Image(
                                imageProvider,
                                width: 70,
                                height: 70,
                                fit: pw.BoxFit.fill
                              ),
                            ),
                            pw.Text(
                              textAlign: pw.TextAlign.center,
                              userDetails.designation,
                              style: pw.TextStyle(
                                  fontSize: 14, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Text(
                              textAlign: pw.TextAlign.center,
                              userDetails.email,
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColor.fromInt(0xFF0000FF)
                              ),

                            ),
                            pw.Text(
                              userDetails.phone,
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      // Name and profile
                      pw.Expanded(
                        flex: 3,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              userDetails.name,
                              style: pw.TextStyle(
                                  fontSize: 27, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xFF8967F8),
                                borderRadius: pw.BorderRadius.circular(10),
                              ),
                              padding: pw.EdgeInsets.all(10),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Profile",
                                    style: pw.TextStyle(
                                        fontSize: 18, fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.Text(
                                    userDetails.profile,
                                    style: pw.TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    color: const PdfColor.fromInt(0xFF222222),
                    height: 2,
                  ),
                  pw.SizedBox(height: 10),

                  // Projects Section
                  pw.Row(
                    children: [
                      // Projects & Experience Details
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Projects",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 18),
                            ),
                            // Display the list of projects
                            pw.Column(
                              children: projects.map((project) => _buildProjectWidget(project)).toList(),
                            ),
                            pw.SizedBox(height: 10,),
                            pw.Column(
                              children: education.map((education) => _buildEducationWidget(education)).toList(),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                  pw.SizedBox(height: 10),
                  // Skill Section
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Skills",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 21),
                              ),
                              pw.SizedBox(height: 5),
                              // Display the list of skills
                              pw.Container(
                                padding: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(10),
                                    color: PdfColor.fromInt(0xFF227899)
                                ),
                                child: pw.Column(
                                  children: skills.map((category) => _buildSkillCategoryWidget(category)).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                ]
            )
          );
        },
      ),
    );
    return pdf.save();
  }

  // Helper function to build the skill category widget
  pw.Widget _buildSkillCategoryWidget(SkillCategory category) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "${category.category}: ",
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        ),
        pw.Expanded( // Use Expanded to ensure that the skills take up available space
          child: pw.Wrap(
            spacing: 1.0, // Spacing between skill items
            runSpacing: 1.0, // Vertical spacing between lines
            children: category.skills.map((skill) => pw.Text("${skill}, ")).toList(),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildEducationWidget(Education education) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 1.0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "Education",
            style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold, fontSize: 18),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                education.name,
                style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                  education.date
              )
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildProjectWidget(Project project) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(project.name, style: pw.TextStyle(fontSize: 14)),
            pw.UrlLink(destination: project.link, child: pw.Text("View")),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: project.description.map((desc) {
            return pw.Bullet(
                text: desc,
                style: pw.TextStyle(fontSize: 9),
                margin: pw.EdgeInsets.zero,
                bulletMargin: pw.EdgeInsets.only(
                  top: 0.7 * PdfPageFormat.mm,
                  left: 5.0 * PdfPageFormat.mm,
                  right: 2.0 * PdfPageFormat.mm,
                ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Resume PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Printing.layoutPdf(onLayout: (format) => _createResumePdf());
          },
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}
