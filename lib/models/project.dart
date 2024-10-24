// Model for Project
class Project {
  final String name;
  final String link;
  final List<String> description;

  Project({required this.name, required this.link, required this.description});
}

final List<Project> projects = [
  Project(
    name: 'Hostel Management App',
    link: 'https://github.com/HK-Gupta/Hostel_Management',
    description: [
      'Technologies Used: Flutter, Node.js, Express, MongoDB, REST API, Provider, Shared Preferences, Nodemailer.',
      'Built a hostel management app with separate panels for 100+ students and admins, enabling issue creation, room availability checks, and room change requests, while admins manage staff and approve changes.',
      'Applied REST APIs in Node.js and Express with MongoDB, reducing data fetch time and ensuring smooth data management. Enhanced UX by using Provider for state management and Shared Preferences',
    ],
  ),
  Project(
    name: 'Stock Quotes App ',
    link: 'https://github.com/HK-Gupta/Stock_Quotes',
    description: [
      'Technologies Used: Flutter, Dart, Firebase, Alpha Vantage API, flutter bloc.',
      'Established a secure user authentication system using Firebase, enabling seamless account creation and login experiences for over 1,000 users while ensuring data privacy and profile update capabilities.',
      'Developed stock search functionality allowing users to search for stocks by symbols and country, view detailed charts spanning 1 year, and access comprehensive stock information.',
    ],
  ),
  Project(
    name: 'Ecommerce Application',
    link: 'https://github.com/HK-Gupta/-Ecommerce',
    description: [
      'Tech Stack: Flutter, Dart, Firebase, Stripe, HTTP, Lottie Animations.',
      'Engineered a robust eCommerce application utilizing Flutter and Firebase, integrating user and admin models to streamline inventory management.',
      'Integrated Stripe and HTTP for secure payment processing, decreasing payment failures, and incorporated LottieAnimations for an intuitive and responsive UI.',
    ],
  ),
];
