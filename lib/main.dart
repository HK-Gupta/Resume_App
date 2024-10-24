import 'package:flutter/material.dart';
import 'package:resume_app/models/user_details.dart';
import 'package:resume_app/presentation/resume_helper.dart';
import 'package:resume_app/presentation/resume_pdf.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResumeHelper(),
    );
  }
}
