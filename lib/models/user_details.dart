class UserDetails {
  final String name;
  final String designation;
  final String email;
  final String phone;
  final String profile;

  UserDetails({
    required this.name,
    required this.designation,
    required this.email,
    required this.phone,
    required this.profile
  });
}

final UserDetails userDetails = UserDetails(
    name: "Harsh Kumar",
    designation: "Application Developer",
    email: "hkgupta@gmail.com",
    phone: "9876543210",
    profile: "Software engineer with experience in mobile app development using Flutter, Dart, and Firebase, and backend expertise in Node.js and MongoDB. Skilled in state management, API integration, and performance optimization. Passionate about solving complex problems and delivering efficient solutions in real-time applications."
);