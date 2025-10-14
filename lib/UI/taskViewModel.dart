import 'package:flutter/foundation.dart'; // Pour ChangeNotifier
import '../models/task.dart'; // Chemin corrigé selon ton architecture

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
    liste = Task.generateTask(5);
    notifyListeners();
  }
}