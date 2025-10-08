import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

import '../models/task.dart';

class MyAPI {
  Future<List<Task>> getTasks() async { // asynchrone repond sans savoir quand (liste de tache) tag a5 sinon await force attente de 1 seconde
    await Future.delayed(Duration(seconds: 1));
    // on attend le chargement de task.json
    final dataString = await _loadAsset('assets/json/tasks.json');
    // on décode un fichier json en une map
    final Map<String, dynamic> json = jsonDecode(dataString);
    // json['tasks'] est une liste dynamique contenant des tasks trouvées dans le json
    if (json['tasks'] != null) {
      final tasks = <Task>[];
      // on boucle sur les taches
      for (var element in json['tasks']) {
        tasks.add(Task.fromJson(element)); 
      }
      return tasks;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

Task createNewTask(int nb) {
  return Task(
    id: '$nb',
    title: 'Tâche $nb',
    description: 'Description de la tâche $nb',
    nbHours: 2 + nb,
    difficulty: (nb % 5) + 1,
    tags: ['tag${nb + 1}', 'flutter'],
    color: Colors.primaries[nb % Colors.primaries.length],
    task: ['Étape A', 'Étape B'],
  );
}

// js = promesse et Dart = Future