import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final int nbHours;
  final int difficulty;
  final List<String> tags;
  final Color color;
  final List<String> task;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.nbHours,
    required this.difficulty,
    required this.tags,
    required this.color,
    required this.task,
  });

  static List<Task> generateTasks(int count) {
    return List.generate(count, (index) {
      return Task(
        id: '$index',
        title: 'Tâche $index',
        description: 'Description de la tâche $index',
        nbHours: 2 + index,
        difficulty: (index % 5) + 1,
        tags: ['tag${index + 1}', 'flutter'],
        color: Colors.primaries[index % Colors.primaries.length],
        task: ['Étape A', 'Étape B'],
      );
    });
  }
}

static Task fromJson(Map<String, dynamic> json) {
    final tags = <String>[];
    final Color clr ;

    clr = Colors.greenAccent;

    if (json['tags'] != null) {
      json['tags'].forEach((t) {
        tags.add(t);
      });
    }
}

return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      nbHours: json['nbHours'],
      difficulty: json['difficulty'],
      tags: tags,
      color: clr,
      task: List<String>.from(json['task'] ?? []),
    );

