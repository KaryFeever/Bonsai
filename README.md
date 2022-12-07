# Bonsai

## Project structure
Folder `assets` contains icons and images  
Main working folder is `lib`
```
lib
├── controllers
│   ├── achievements_page
│   ├── creation_page
│   │   └── creation_controller.dart
│   ├── home_page
│   ├── navigation_page
│   │   └── navigation_controller.dart
│   ├── settings_page
│   └── tips_page
├── main.dart
├── models
│   ├── care_type.dart
│   ├── plant.dart
│   └── plants.dart
├── utils
│   └── styles.dart
└── views
    ├── achievements_page
    │   └── achievements_page.dart
    ├── creation_page
    │   ├── creation_page.dart
    │   └── widgets
    │       └── care_configuration.dart
    ├── home_page
    │   └── home_page.dart
    ├── navigation_page
    │   └── navigation_page.dart
    ├── settings_page
    │   └── settings_page.dart
    └── tips_page
        └── tips_page.dart
```

Folder `Views` contains the visual part of application screens  
Folder `Controllers` contains functions that processes user activity in the application  
Folder `Models` contains data structures of the application

## Open Simulator
```
$ open -a Simulator
```
Go to `File->Open Simulator->Iphone 11`

## Run the app
```
$ cd bonsai
$ flutter run 
```
