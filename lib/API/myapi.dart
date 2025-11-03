import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/task.dart';

class MyAPI {
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/tasks.json');
    final json = jsonDecode(dataString);
    if (json.isNotEmpty) {
      final tasks = <Task>[];
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
