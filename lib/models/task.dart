import 'package:flutter/material.dart';

class Task {
  static int nb = 0; 
  
  final int id;
  final String title;
  final List<String> tags;
  final int nbhours;
  final int difficulty;
  final String description;
  final Color color; 

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'tags': tags.join(','),
      'nbhours': nbhours,
      'difficulty': difficulty,
      'description': description,
      'color': color.value.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    // Gestion des types lus depuis SQLite
    return Task(
      id: map['id'] is int ? map['id'] : int.parse(map['id'].toString()),
      title: map['title'],
      tags: (map['tags'] as String).split(','),
      nbhours: map['nbhours'] is int ? map['nbhours'] : int.parse(map['nbhours'].toString()),
      difficulty: map['difficulty'] is int ? map['difficulty'] : int.parse(map['difficulty'].toString()),
      description: map['description'],
      color: Color(int.parse(map['color'])),
    );
  }

  static List<Task> generateTask(int i) {
    List<Task> tasks = [];
    for (int n = 1; n <= i; n++) {
      tasks.add(Task(
        id: n,
        title: "Titre $n",
        description: "Ceci est la description détaillée de la tâche numéro $n.",
        tags: ['tag $n', 'important'],
        nbhours: (n % 5) + 1,
        difficulty: (n % 5) + 1,
        color: Colors.primaries[n % Colors.primaries.length],
      ));
      nb = n; 
    }
    return tasks;
  }
}