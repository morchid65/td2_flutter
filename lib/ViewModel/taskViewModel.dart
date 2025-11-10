// lib/ViewModel/task_view_model.dart
import 'package:flutter/material.dart'; 
import '../models/task.dart'; 

class TaskViewModel extends ChangeNotifier {
  late List<Task> liste;

  TaskViewModel() {
    liste = [];
    generateTasks(); 
  }

  void addTask(Task task) {
    liste.add(task);
    notifyListeners(); 
  }

  void deleteTask(int id) {
    liste.removeWhere((task) => task.id == id);
    notifyListeners();
  }
  
  void updateTask(Task updatedTask) {
    int index = liste.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      liste[index] = updatedTask;
      notifyListeners();
    }
  }

  void generateTasks() {

    liste = Task.generateTask(50);
    notifyListeners();
  }
}