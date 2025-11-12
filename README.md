# 🚀 Gestionnaire de Tâches Flutter : MVVM, Repository & SQLite (TD2 à TD4)

Ce projet est une application de gestion de tâches développée en Flutter/Dart. Il a servi de support pour mettre en œuvre une architecture logicielle moderne, en passant d'une simple lecture de données (TD2) à une implémentation complète du pattern **MVVM** avec une couche de **Repository** pour la **persistance SQLite** (TD4).

---

## 📊 Statistiques de Développement

### ⏱️ Temps de Codage (WakaTime)

Le temps passé sur ce projet est suivi via WakaTime.

> **Note :** Le badge ci-dessous pointe directement vers le projet **Flutter Task Manager** pour un suivi précis.

| Composant | Statistique Clé | Intégration Recommandée (GitHub Readme Stats) |
| :--- | :--- | :--- |
| Activité Totale | Heures de codage brutes | [![My WakaTime Stats](https://github-readme-stats.vercel.app/api/wakatime?username=morchid65&layout=compact&hide_title=true&hide_border=true)](https://wakatime.com/@morchid65) |
| Langages | Dart, YAML, etc. | [![WakaTime: Langages](https://github-readme-stats.vercel.app/api/wakatime?username=morchid65&langs=true&hide_title=true&hide_border=true)](https://wakatime.com/@morchid65) |

<p align="center">
    [![wakatime](https://wakatime.com/badge/user/3d07be02-2a28-4eec-96eb-751c50769ce3/project/815baf83-8831-4339-845c-df23def8ea2b.svg)](https://wakatime.com/badge/user/3d07be02-2a28-4eec-96eb-751c50769ce3/project/815baf83-8831-4339-845c-df23def8ea2b)
</p>

---

## 🛠️ Stack Technique

| Composant | Technologie | Version Clé | Rôle dans le Projet |
| :--- | :--- | :--- | :--- |
| **Framework** | Flutter / Dart | ``sdk: '>=3.0.0 <4.0.0'`` | Développement cross-platform de l'application. |
| **Architecture** | MVVM | N/A | Séparation stricte des responsabilités (View, ViewModel, Model). |
| **Gestion d'État** | `provider` | `^6.1.2` | Rendre les ViewModels accessibles et notifiables par l'interface utilisateur. |
| **Persistance Tâches** | `sqflite` / `path` | `^2.3.2` / `^1.8.3` | Stockage persistant des objets `Task` dans une base de données locale (TD4). |
| **Persistance Thème**| `shared_preferences` | `^2.2.3` | Sauvegarde du réglage du Mode Sombre/Clair (TD3). |
| **Compatibilité** | `sqflite_common_ffi` | `^2.3.6` | **Solution Critique** d'initialisation conditionnelle de la DB pour les plateformes Desktop (Windows, Linux, macOS) dans `main.dart`. |
| **UI** | `settings_ui` | `^2.1.0` | Affichage structuré de l'écran des paramètres. |

---

## 🗺️ Évolution de l'Architecture et des Fonctionnalités

### 🎯 TD2 : Les Fondations (UI & API Factice)

* **Modèle `Task` :** Définition de la structure de l'objet métier avec des méthodes utilitaires comme `Task.fromMap` pour la désérialisation JSON.
* **Couche de Données Factice :** La classe `MyAPI` lit les données des tâches à partir du fichier local `assets/tasks.json`.
* **Affichage Asynchrone :** Les widgets utilisent `FutureBuilder` pour consommer l'API de manière asynchrone et afficher les listes (`Card 2` et `Card 3`).

### 🎯 TD3 : Passage au MVVM et Thème Persistant

* **MVVM avec Provider :** Introduction de la séparation stricte : `TaskViewModel` et `SettingViewModel`.
* **Repository Pattern (Paramètres) :** Utilisation de `SettingRepository` et `shared_preferences` pour sauvegarder le choix du thème de manière persistante.
* **UI Réactive :** Le widget `Card 1` devient réactif en utilisant `context.watch<TaskViewModel>()` et `Card 4` (`EcranSettings`) gère la bascule du thème.

### 🎯 TD4 : Persistance Définitive (Repository Pattern & SQLite)

* **`TaskRepository` :** Création de la classe pour encapsuler toute la logique **CRUD** (`insert`, `get`, `update`, `delete`) avec une base de données locale SQLite (`tasks.db`).
* **Mise à Jour du Modèle :** Le modèle `Task` est étendu avec `toMap()` et `Task.fromMap()` pour gérer la sérialisation bidirectionnelle (DB vs. JSON).
* **Mise à Jour du ViewModel :** Le `TaskViewModel` est refactorisé pour utiliser le `TaskRepository`, assurant la persistance des données après la fermeture de l'application.
* **Formulaire Avancé :** Implémentation du `TaskFormScreen` pour la saisie et l'édition des tâches, utilisant le même écran pour les deux opérations.
* **Correction FFI :** Intégration de la logique de compatibilité Desktop (`sqflite_common_ffi`) dans `main.dart` pour garantir le fonctionnement du SQLite sur toutes les plateformes de développement.

---

## 🏗️ Structure du Code

Voici l'arborescence des fichiers clés, organisée par responsabilités architecturales :

```bash
.
├── lib/
│   ├── api/
│   │   └── myapi.dart             # Couche de données factice.
│   ├── models/
│   │   └── task.dart              # Modèle métier avec fromMap/toMap.
│   ├── repository/
│   │   ├── settings_repository.dart # Repository SharedPreferences.
│   │   └── task_repository.dart   # Repository SQLite (CRUD).
│   ├── UI/
│   │   ├── card1.dart, card2.dart, card3.dart, card4.dart # Les écrans de l'application.
│   │   ├── detail.dart, ecran_settings.dart, mytheme.dart
│   │   └── task_form_screen.dart  # Formulaire CRUD avancé.
│   ├── ViewModel/
│   │   ├── setting_view_model.dart  # Logique métier du thème.
│   │   └── taskViewModel.dart     # Logique métier des tâches (utilise TaskRepository).
│   └── main.dart                  # Point d'entrée, MultiProvider et correction FFI.
└── pubspec.yaml                 # Fichier de dépendances.
🚀 Guide de Démarrage
Cloner le dépôt.

Installer les dépendances :

Bash

flutter pub get
Lancer l'application :

Bash

flutter run
