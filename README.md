# 🚀 Gestionnaire de Tâches Flutter : MVVM, Repository & SQLite (TD2 à TD4)

Ce projet est une application de gestion de tâches développée en Flutter/Dart. Il a servi de support pour mettre en œuvre une architecture logicielle moderne, en passant d'une simple lecture de données (TD2) à une implémentation complète du pattern **MVVM** avec une couche de **Repository** pour la **persistance SQLite** (TD4).

## 🛠️ Stack Technique

| Composant | Technologie | Version Clé | Rôle dans le Projet |
| :--- | :--- | :--- | :--- |
| **Framework** | Flutter / Dart | `sdk: '>=3.9.0 <4.0.0'` | Développement cross-platform de l'application. |
| **Architecture** | MVVM | N/A | Séparation stricte des responsabilités (View, ViewModel, Model). |
| **Gestion d'État** | `provider` | `^6.1.1` | Rendre les ViewModels accessibles et notifiables par l'interface utilisateur. |
| **Persistance Tâches** | `sqflite` / `path` | `^2.3.0` / `^1.8.3` | Stockage persistant des objets `Task` dans une base de données locale (TD4). |
| **Persistance Thème**| `shared_preferences` | `^2.2.2` | Sauvegarde du réglage du Mode Sombre/Clair (TD3). |
| **Compatibilité** | `sqflite_common_ffi` | `^2.3.0` | Solution d'initialisation conditionnelle de la DB pour les plateformes Desktop (Windows, Linux, macOS) dans `main.dart`. |
| **UI** | `settings_ui` | `^2.0.2` | Affichage structuré de l'écran des paramètres. |

---

## 🗺️ Évolution de l'Architecture et des Fonctionnalités

### 🎯 TD2 : Les Fondations (UI & API Factice)

* **Modèle `Task` :** Définition de la structure de l'objet métier (`id`, `title`, `tags`, `nbhours`, `difficulty`, `description`, `color`) avec des méthodes utilitaires comme **`fromJson`**.
* **Couche de Données Factice :** La classe **`MyAPI`** est implémentée pour lire les données des tâches à partir du fichier local **`assets/tasks.json`**, simulant l'interaction avec un backend.
* **Affichage :** Les widgets `Ecran2` et `Ecran3` utilisent **`FutureBuilder`** pour consommer l'API de manière asynchrone et afficher les listes (`ListView.builder`).
* **Détail :** Le widget **`Detail`** affiche les propriétés complètes de la `Task` sélectionnée.

### 🎯 TD3 : Passage au MVVM et Thème Persistant

* **MVVM avec Provider :** Migration vers le pattern MVVM :
    * **`TaskViewModel` :** Gère la liste des tâches en mémoire (`late List<Task> liste`) et expose la méthode **`addTask(Task.newTask())`** et **`generateTasks()`**.
    * **`SettingViewModel` :** Gère l'état `isDark` du thème.
* **Repository Pattern (Paramètres) :** Introduction d'une couche de données pour les paramètres avec **`SettingRepository`** qui utilise **`shared_preferences`** pour sauvegarder et récupérer le choix du thème.
* **UI Réactive :**
    * Le widget **`Ecran1`** remplace l'ancien `FutureBuilder` et utilise **`context.watch<TaskViewModel>()`** pour réagir automatiquement aux changements de la liste en mémoire.
    * Le widget **`EcranSettings`** utilise **`context.read/watch<SettingViewModel>()`** pour lire l'état initial et modifier le thème de manière persistante.
    * Le bouton **FAB** sur la `Home` navigue vers **`AddTask`** qui appelle `context.read<TaskViewModel>().addTask()`.

### 🎯 TD4 : Persistance Définitive (Repository Pattern & SQLite)

* **Objectif :** Rendre les tâches persistantes. L'implémentation est mise à jour pour utiliser une base de données locale SQLite.
* **`TaskRepository` :** Création de la classe **`TaskRepository`** pour encapsuler toute la logique d'accès à la DB (`tasks.db`), incluant :
    * **`_initDB()`** : Création de la table `'tasks'` (avec les colonnes `id`, `title`, `tags`, `nbhours`, `difficulty`, `description`, `color` stockée en `INTEGER`).
    * Implémentation des méthodes **CRUD** (`insertTask`, `getTasks`, `updateTask`, `deleteTask`).
* **Mise à Jour du Modèle :** Le modèle **`Task`** est étendu avec **`toMap()`** et **`Task.fromMap()`** pour les besoins de sérialisation/désérialisation de `sqflite`.
* **Mise à Jour du ViewModel :** Le **`TaskViewModel`** est refactorisé pour utiliser le `TaskRepository` au lieu de la liste en mémoire, assurant la persistance des données.
* **Formulaire Avancé :** Remplacement de l'ancien `AddTask` par un **`TaskFormScreen`** utilisant un `Form` complet pour la saisie et l'édition des tâches. Le même écran gère l'**Ajout** (pas de `Task` passée) et l'**Édition** (une `Task` est passée).
* **Correction FFI :** Ajout de la logique de compatibilité Desktop (`sqflite_common_ffi` et `databaseFactory = databaseFactoryFfi;`) dans **`main.dart`** pour garantir le fonctionnement du SQLite sur toutes les plateformes de développement.

---

---

## 🏗️ Structure du Code

Voici l'arborescence des fichiers clés, organisée par responsabilités architecturales. Cette structure reflète l'évolution du projet du TD2 au TD4 :

```bash
.
├── lib/
│   ├── api/
│   │   └── myapi.dart             # (TD2) Couche de données factice, lecture de 'assets/tasks.json'.
│   ├── models/
│   │   └── task.dart              # (TD2->TD4) Modèle métier avec fromJson/toMap.
│   ├── repository/
│   │   ├── settings_repository.dart # (TD3) Repository pour SharedPreferences (Thème).
│   │   └── task_repository.dart   # (TD4) Repository pour SQLite (CRUD des Tâches).
│   ├── UI/
│   │   ├── add_task.dart          # (TD3) Widget simple pour ajouter une tâche (Remplacé par le formulaire en TD4).
│   │   ├── card1.dart             # (TD3/TD4) Liste des tâches MVVM (Ecran1).
│   │   ├── card2.dart             # (TD2) Ancienne liste des tâches (FutureBuilder, Ecran2).
│   │   ├── card3.dart             # (TD2) Ancienne liste des tâches (FutureBuilder, Ecran3).
│   │   ├── detail.dart            # (TD2) Écran de détail d'une tâche.
│   │   ├── ecran_settings.dart    # (TD3) Écran des paramètres (EcranSettings).
│   │   ├── home.dart              # (TD3/TD4) Widget principal, navigation (BottomBar/FAB).
│   │   ├── mytheme.dart           # (TD3) Définition des thèmes Light et Dark.
│   │   └── task_form_screen.dart  # (TD4) Formulaire CRUD (Ajout/Édition avancée des tâches).
│   ├── ViewModel/
│   │   ├── setting_view_model.dart  # (TD3) Logique métier du thème (ChangeNotifier).
│   │   └── taskViewModel.dart     # (TD3/TD4) Logique métier des tâches (utilise TaskRepository en TD4).
│   └── main.dart                  # (TD3/TD4) Point d'entrée, MultiProvider et correction FFI.
└── pubspec.yaml                 # Fichier de dépendances.

## 🚀 Guide de Démarrage

1.  **Cloner le dépôt.**
2.  **Installer les dépendances :**
    ```bash
    flutter pub get
    ```
3.  **Lancer l'application :**
    ```bash
    flutter run
    ```
