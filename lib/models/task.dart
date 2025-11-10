
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

  factory Task.newTask() {
    Task.nb++; 
    return Task(
        id: Task.nb,
        title: 'title ${Task.nb}',
        tags: ['tag ${Task.nb}', 'tag${Task.nb + 1}'],
        nbhours: Task.nb,
        difficulty: Task.nb % 5,
        description: 'description ${Task.nb}',
        color: Colors.lightBlue,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as int,
        title: json['title'] as String,
        tags: (json['tags'] as List).map((e) => e.toString()).toList(),
        nbhours: json['nbhours'] as int,
        difficulty: json['difficulty'] as int,
        description: json['description'] as String,
        color: Colors.lightBlue, 
    );
  }

  static List<Task> generateTask(int count) {
    if (Task.nb > 0) Task.nb = 0; 
    return List.generate(count, (index) => Task.newTask());
  }
}