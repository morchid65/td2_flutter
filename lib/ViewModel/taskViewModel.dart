import 'package:flutter/material.dart'; 
import '../models/task.dart'; 

class TaskViewModel extends ChangeNotifier {
  late List<Task> liste;

  TaskViewModel() {
    liste = [];
  }

  void addTask(Task task) {
    liste.add(task);
    notifyListeners(); 
  }

  void generateTasks() {
    liste = Task.generateTask(50); 
    notifyListeners();
  }
}