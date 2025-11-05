import 'package:flutter/material.dart';

class Task {
  static int nb = 0; 

  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  Color color;

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

  static List<Task> generateTask(int count) {
    if (Task.nb > 0) Task.nb = 0; 
    return List.generate(count, (index) => Task.newTask());
  }

  static Task fromJson(Map<String, dynamic> json) {
    final tags =
        (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return Task(
      id: json['id'],
      title: json['title'],
      tags: tags,
      nbhours: json['nbhours'],
      difficulty: json['difficulty'],
      description: json['description'],
      color: json['color'] != null
          ? _parseColor(json['color'])
          : Colors.greenAccent,
    );
  }

  static Color _parseColor(String colorString) {
    colorString = colorString.replaceAll("#", "");
    if (colorString.length == 6) {
      colorString = "FF$colorString";
    }
    return Color(int.parse("0x$colorString"));
  }
}