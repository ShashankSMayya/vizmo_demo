# vizmo_demo

A flutter project as per the assessment question given by Vizmo.

## Getting Started

The project requires Flutter to be installed on your machine. You can find the installation
instructions [here](https://flutter.dev/docs/get-started/install).

Once you have Flutter installed, you can run the project by running the following command in the
project directory:

Before running the project, you need to run the following command to install the dependencies:

```bash
flutter pub get
```

To get the generated files for the project, run the following command:

```bash
flutter pub run build_runner build  -d
```

or

```bash
flutter pub run build_runner watch  -d
```

Then you can run the project by running the following command:

```bash
flutter run
```

## Project Info

Uses Flutter Version: 3.3.6 (stable)
Uses Dart Version: 2.18.4 (stable)

The project uses Repository pattern Architecture. The project is divided into 3 layers:

1. Data Layer
2. Domain Layer
3. Presentation Layer

More Info about the repository pattern can be
found [here](https://codewithandrea.com/articles/flutter-repository-pattern/).

Uses flutter_bloc for state management.
More info about flutter_bloc can be found [here](https://bloclibrary.dev/#/).

The project uses [GetIt](https://pub.dev/packages/get_it) for dependency injection.

The project uses [JsonSerializable](https://pub.dev/packages/json_serializable) to generate the json model parsing.

Built by
[Shashank S Mayya](https://github.com/ShashankSMayya)


