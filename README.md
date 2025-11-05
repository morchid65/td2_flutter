🎓 Projet Flutter : Gestionnaire de Tâches Persistant (TD2 à TD4)
Ce projet est une application de gestion de tâches développée en Flutter. Il a été structuré pour illustrer l'évolution d'une architecture logicielle, allant d'une lecture de données locale à une implémentation robuste du pattern MVVM (Model-View-ViewModel) avec persistance via SQLite.

🛠️ Stack Technique
Framework : Flutter / Dart

Architecture : MVVM (Model-View-ViewModel)

Gestion d'État : provider

Couche de Données : Repository Pattern (TaskRepository, SettingRepository)

Persistance Tâches : sqflite (SQLite)

Persistance Thème : shared_preferences

Compatibilité : sqflite_common_ffi (pour support Desktop)

🗺️ Évolution du Projet
TD2 : Fondations et API Factice
Objectif : Mise en place des modèles (Task), de l'interface utilisateur de base, et de la navigation.

Implémentation : Les données des tâches sont chargées à partir d'un fichier JSON local (assets/tasks.json) via la classe MyAPI, simulant une source de données externe. L'affichage utilise FutureBuilder (card2.dart / card3.dart).

TD3 : Introduction du MVVM et Thème Persistant
Objectif : Adopter une architecture réactive et gérer la persistance des paramètres.

Implémentation :

Création des ViewModels (TaskViewModel et SettingViewModel) et intégration de provider. L'UI (card1.dart) réagit aux changements via context.watch.

Mise en place du SettingRepository pour sauvegarder le choix du mode sombre/clair (isDark) en utilisant shared_preferences.

Le bouton "Add Task" (add_task.dart) ajoute des tâches en mémoire (Task.newTask()).

TD4 : Persistance Définitive (SQLite) et CRUD Complet
Objectif : Rendre les données des tâches persistantes et finaliser les fonctionnalités CRUD.

Implémentation :

TaskRepository est créé, gérant la connexion et les requêtes SQLite (sqflite).

Le TaskViewModel est refactorisé pour dépendre exclusivement du TaskRepository, assurant la Séparation des Préoccupations.

Mise à jour du modèle Task avec les méthodes toMap() et Task.fromMap() pour la sérialisation/désérialisation de la base de données.

Remplacement de l'ancien AddTask par un TaskFormScreen unique capable de gérer l'Ajout et l'Édition des tâches, ainsi que la Suppression (deleteTask).

⚙️ Démarrage Rapide
Cloner le dépôt.

Installer les dépendances (incluant sqflite, path, et sqflite_common_ffi pour le support multiplateforme).

Bash

flutter pub get
Lancer l'application.

Bash

flutter run
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
