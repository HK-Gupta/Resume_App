import 'package:flutter/material.dart';
import 'package:resume_app/presentation/resume_pdf.dart';

import 'models/resume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResumePDF(resume: Resume(
        name: 'Harsh Kumar',
        contact: '+91 9876543210',
        email: 'harsh@example.com',
        education: 'B.Tech in Computer Science, XYZ University',
        experience: 'Software Developer Intern at ABC Company',
        skills: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      )),
    );
  }
}
