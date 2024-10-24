class SkillCategory {
  final String category;
  final List<String> skills;

  SkillCategory(this.category, this.skills);
}

final List<SkillCategory> skills = [
  SkillCategory('Languages', ['C', 'C++', 'Java', 'Kotlin', 'Python', 'SQL', 'XML', 'Dart']),
  SkillCategory('Frameworks', ['Jetpack Compose', 'Flask', 'MongoDB', 'Flutter', 'React Native']),
  SkillCategory('Clouds & Databases', ['AWS', 'Firebase', 'MongoDB']),
  SkillCategory('Backend Technologies', ['Node.js', 'Express', 'REST API']),
  SkillCategory('Android Libraries', ['Retrofit', 'Dagger', 'Room', 'Jetpack', 'Volley', 'Webview']),
  SkillCategory('Python Libraries', ['NumPy', 'Matplotlib', 'TensorFlow', 'PyTorch', 'Scikit-learn']),
  SkillCategory('Tools', ['Git/GitHub', 'Android Studio', 'VS Code', 'Postman', 'Unix Shell']),
];