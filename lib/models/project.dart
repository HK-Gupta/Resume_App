// Model for Project
class Project {
  final String name;
  final String link;
  final List<String> description;

  Project({required this.name, required this.link, required this.description});
}

final List<Project> projects = [
  Project(
    name: 'News App',
    link: 'https://github.com/HK-Gupta/news-app',
    description: [
      'Built using MVVM architecture and Kotlin.',
      'Implemented real-time news fetching using REST API.',
      'Integrated Firebase for authentication and data storage.',
      'Deployed to Play Store with over 500 downloads.'
    ],
  ),
  Project(
    name: 'Tic-Tac-Toe Multiplayer',
    link: 'https://github.com/HK-Gupta/tic-tac-toe',
    description: [
      'Developed using Flutter, Firebase, and Google Sign-In.',
      'Features both offline solo and multiplayer modes.',
      'Integrated auto-generated room key and user statistics.',
      'Smooth UI/UX with responsive design.'
    ],
  ),
  Project(
    name: 'News App',
    link: 'https://github.com/HK-Gupta/news-app',
    description: [
      'Built using MVVM architecture and Kotlin.',
      'Implemented real-time news fetching using REST API.',
      'Integrated Firebase for authentication and data storage.',
      'Deployed to Play Store with over 500 downloads.'
    ],
  ),
  Project(
    name: 'Tic-Tac-Toe Multiplayer',
    link: 'https://github.com/HK-Gupta/tic-tac-toe',
    description: [
      'Developed using Flutter, Firebase, and Google Sign-In.',
      'Features both offline solo and multiplayer modes.',
      'Integrated auto-generated room key and user statistics.',
      'Smooth UI/UX with responsive design.'
    ],
  ),
];
