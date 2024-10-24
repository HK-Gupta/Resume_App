import 'package:flutter/material.dart';
import 'package:resume_app/config/assets_path.dart';
import 'package:resume_app/models/education.dart';
import 'package:resume_app/models/project.dart';
import 'package:resume_app/models/user_details.dart';
import 'package:resume_app/presentation/resume_pdf.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/skills.dart'; // To handle project link clicks

class ResumeHelper extends StatelessWidget {
  // final UserDetails userDetails;
  const ResumeHelper({super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    // Hardcoded list of projects

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                // Top Portion
                Row(
                  children: [
                    // Image and details
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              ImagePath.picture,
                              width: 70,
                              height: 70,
                              fit: BoxFit.fill,
                            ),

                          ),
                          Text(
                            textAlign: TextAlign.center,
                            userDetails.designation,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            userDetails.email,
                            style: TextStyle(
                                fontSize: 12,
                              color: Colors.blue[900]
                            ),

                          ),
                          Text(
                            userDetails.phone,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Name and profile
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userDetails.name,
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userDetails.profile,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: w * 0.87,
                  color: Colors.grey,
                  height: 2,
                ),
                const SizedBox(height: 10),
                // Projects Section
                Row(
                  children: [
                    // Projects & Experience Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Projects",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // Display the list of projects
                          Column(
                            children: projects.map((project) => _buildProjectWidget(project)).toList(),
                          ),
                          const SizedBox(height: 10,),
                          Column(
                            children: education.map((education) => _buildEducationWidget(education)).toList(),
                          )
                        ],
                      ),
                    ),

                  ],
                ),

                // Skill Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Skills",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            const SizedBox(height: 10),
                            // Display the list of skills
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey[100]
                              ),
                              child: Column(
                                children: skills.map((category) => _buildSkillCategoryWidget(category)).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ResumePDF(userDetails: userDetails, projects: projects, education: education, skills: skills)));
                  },
                  child: Text("Goto Next"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build the skill category widget
  Widget _buildSkillCategoryWidget(SkillCategory category) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${category.category}: ",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Expanded( // Use Expanded to ensure that the skills take up available space
          child: Wrap(
            spacing: 1.0, // Spacing between skill items
            runSpacing: 1.0, // Vertical spacing between lines
            children: category.skills.map((skill) => Text("${skill}, ")).toList(),
          ),
        ),
      ],
    );
  }



  Widget _buildEducationWidget(Education education) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Education",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                education.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                education.date
              )
            ],
          ),
        ],
      ),
    );
  }
  // Helper function to build the project widget
  Widget _buildProjectWidget(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Name and Link
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => _launchURL(project.link),
                child: const Text(
                  "View",
                  style: TextStyle(fontSize: 13, color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          // Project description points
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: project.description
                .map((point) => Row(
                  children: [
                    const Icon(Icons.brightness_1, size: 5),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ))
                .toList(),
          ),
        ],
      ),
    );
  }

  // Helper function to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


