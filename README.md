# 🚀 Gestionnaire de Tâches Flutter : MVVM, Repository & SQLite (TD2 à TD4)

Ce projet est une application de gestion de tâches développée en Flutter/Dart. Il a servi de support pour mettre en œuvre une architecture logicielle moderne, en passant d'une simple lecture de données (TD2) à une implémentation complète du pattern **MVVM** avec une couche de **Repository** pour la **persistance SQLite** (TD4).

---

## 📊 Statistiques de Développement (WakaTime)

Ce badge reflète le temps de codage consacré spécifiquement à ce projet.

<p align="center">
    [![wakatime](https://wakatime.com/badge/user/3d07be02-2a28-4eec-96eb-751c50769ce3/project/815baf83-8831-4339-845c-df23def8ea2b.svg)](https://wakatime.com/badge/user/3d07be02-2a28-4eec-96eb-751c50769ce3/project/815baf83-8831-4339-845c-df23def8ea2b)
</p>

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
