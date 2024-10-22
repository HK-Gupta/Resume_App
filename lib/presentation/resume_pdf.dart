import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

import '../models/resume.dart';

class ResumePDF extends StatelessWidget {
  final Resume resume;

  ResumePDF({required this.resume});

  Future<Uint8List> _createResumePdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(resume.name, style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 8),
              pw.Text('Contact: ${resume.contact}', style: pw.TextStyle(fontSize: 16)),
              pw.Text('Email: ${resume.email}', style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 16),
              pw.Text('Education:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text(resume.education),
              pw.SizedBox(height: 16),
              pw.Text('Experience:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text(resume.experience),
              pw.SizedBox(height: 16),
              pw.Text('Skills:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Bullet(
                text: resume.skills.join(', '),
                style: pw.TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resume PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Printing.layoutPdf(onLayout: (format) => _createResumePdf());
          },
          child: Text('Generate Resume PDF'),
        ),
      ),
    );
  }
}
