import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/task.dart';
import 'package:http/http.dart' as http;

class MyAPI {
  /* Pour écran n°2 basé sur la lecture du fichier JSON local**/
  Future<List<Task>> getTasks() async {
    // on attend une seconde
    await Future.delayed(const Duration(seconds: 1));
    // on attend le chargement de tasks.json
    final dataString = await _loadAsset('assets/tasks.json');
    // on decode un fichier json
    final json = jsonDecode(dataString);
    // json["tasks"] contient la liste des tasks trouvée dans le fichier
    if (json.isNotEmpty) {
      final tasks = <Task>[];
      // on boucle sur les tâches
      json["tasks"].forEach((element) {
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}