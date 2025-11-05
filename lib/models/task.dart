import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; // Assurez-vous d'avoir ce package si vous voulez utiliser firstWhereOrNull

class Task {
  static int nb = 0;

  final int? id; // Rendu nullable pour la DB
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  Color color;

  Task({
    this.id, // L'ID est géré par la DB
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
    required this.color,
  });
  
  // --- NOUVELLES MÉTHODES POUR SQFLITE ---

  // Convertit un objet Task en Map pour l'insertion/mise à jour DB
  Map<String, dynamic> toMap() {
    return {
      // 'id': id, // Omettre l'ID pour l'insertion, le garder pour l'update
      'title': title,
      'tags': tags.join(','), // Convertir List<String> en String séparé par des virgules
      'nbhours': nbhours,
      'difficulty': difficulty,
      'description': description,
      'color': color.value, // Convertir Color en int
      // Inclure l'ID seulement s'il existe pour la mise à jour
      if (id != null) 'id': id, 
    };
  }

  // Crée un objet Task à partir d'un Map (lecture DB)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      tags: (map['tags'] as String).split(','),
      nbhours: map['nbhours'],
      difficulty: map['difficulty'],
      description: map['description'],
      color: Color(map['color']),
    );
  }

  // --- ANCIENNES MÉTHODES MISES À JOUR ---

  // Ajusté pour ne plus attribuer l'ID manuellement
  factory Task.newTask() {
    Task.nb++; 
    return Task(
        title: 'Nouvelle Tâche',
        tags: ['tag', 'auto'],
        nbhours: 1,
        difficulty: 1,
        description: 'Description auto-générée.',
        color: Colors.lightBlue,
    );
  }
  
  // Conserver fromJson pour la compatibilité avec l'API (TD2) si nécessaire
  static Task fromJson(Map<String, dynamic> json) {
      final tags = (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return Task(
      id: json['id'],
      title: json['title'],
      tags: tags,
      nbhours: json['nbhours'],
      difficulty: json['difficulty'],
      description: json['description'],
      color: Color(json['color'] is int ? json['color'] : Colors.lightBlue.value), 
    );
  }
}