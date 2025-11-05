import 'package:flutter/material.dart'; 
import 'package:td2_app/models/task.dart'; 
import '../repository/task_repository.dart'; 

class TaskViewModel extends ChangeNotifier {
  List<Task> _liste = [];
  final TaskRepository _repository = TaskRepository(); 

  List<Task> get liste => _liste;

  TaskViewModel() {
    loadTasks(); 
  }

  Future<void> loadTasks() async {
    _liste = await _repository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _repository.insertTask(task);
    await loadTasks(); 
  }

  Future<void> updateTask(Task task) async {
    if (task.id != null) {
      await _repository.updateTask(task);

      final index = _liste.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _liste[index] = task;
      }
      notifyListeners();
    }
  }

  Future<void> deleteTask(int id) async {
    await _repository.deleteTask(id);

    _liste.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}