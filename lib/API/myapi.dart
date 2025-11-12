import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/task.dart';
import 'package:flutter/material.dart';

class MyAPI {

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1)); 

    final dataString = await _loadAsset('assets/tasks.json');
    
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['tasks'] != null) {
      final tasks = <Task>[];
      
      for (var element in json['tasks']) {
        tasks.add(Task(
          id: element['id'],
          title: element['title'],
          tags: List<String>.from(element['tags']),
          nbhours: element['nbhours'],
          difficulty: element['difficulty'],
          description: element['description'],
          color: Color(int.parse(element['color'])), 
        ));
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