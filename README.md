# goal_planning

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Using Flutter SDK 3.32.0


Clean Architecture (Feature First) Structure
features/
└── login/
├── data/
│   ├── datasources/
│   │   └── login_remote_data_source.dart
│   ├── models/
│   │   └── login_request_model.dart
│   └── repositories/
│       └── login_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── user.dart
│   ├── repositories/
│   │   └── login_repository.dart
│   └── usecases/
│       └── login_user.dart
├── presentation/
│   ├── bloc/
│   │   ├── login_bloc.dart
│   │   └── login_event.dart
│   ├── pages/
│   │   └── login_page.dart
│   └── widgets/
│       └── login_form.dart
└── login_feature.dart


library login_feature;

// Expose domain use cases
export 'domain/usecases/login_user.dart';

// Expose UI entry point
export 'presentation/pages/login_page.dart';

// Expose bloc or state management if needed
export 'presentation/bloc/login_bloc.dart';
