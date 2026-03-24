# AGENTS.md - School Schedule Control App

## Project Overview
Flutter app for school schedule management with role-based access (Admin, Professor, Student).

## Key Commands
- `flutter run` - Run the app
- `flutter build web` - Build for web
- `flutter analyze` - Run Flutter analyzer

## Code Structure
```
lib/
├── main.dart              # App entry point
├── models/                # Data models (usuario, falta, aula, observacao, registro_ponto)
├── screens/               # UI screens
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── cadastro_screen.dart
│   ├── splash_screen.dart
│   ├── historico_screen.dart
│   └── dashboard/         # Role-specific dashboards
│       ├── admin/
│       ├── professor/
│       └── aluno/
└── services/
    └── database_service.dart
```

## Dependencies
- shared_preferences: ^2.2.2
- Flutter Material Design

## Important Notes
- Uses local storage via shared_preferences
- Role-based dashboard routing in home_screen.dart
- Database service manages data persistence