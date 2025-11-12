import 'package:flutter/material.dart'; 
import '../models/task.dart'; 
import '../repository/task_repository.dart'; 

class TaskViewModel extends ChangeNotifier {
  late List<Task> _liste;
  final TaskRepository _repository = TaskRepository();

  List<Task> get liste => _liste;

  TaskViewModel() {
    _liste = [];
    loadTasks();
  }

  Future<void> loadTasks() async {
    _liste = await _repository.getTasks();
    
    if (_liste.isEmpty) {
      _liste = Task.generateTask(20);
      for (var task in _liste) {
        await _repository.insertTask(task);
      }
    }
    notifyListeners();
  }

  Future<void> addTask(Task task) async {

    if (task.id == 0) {

        int maxId = _liste.isEmpty 
            ? 0 
            : _liste.map((t) => t.id).reduce((a, b) => a > b ? a : b);
        
        int newId = maxId + 1;

        task = Task( 
            id: newId, 
            title: task.title, 
            tags: task.tags, 
            nbhours: task.nbhours, 
            difficulty: task.difficulty, 
            description: task.description, 
            color: task.color
        );
    }
    
    await _repository.insertTask(task); 
    
    await loadTasks();
  }

  Future<void> updateTask(Task updatedTask) async {
    await _repository.updateTask(updatedTask);
    await loadTasks(); 
  }

  Future<void> deleteTask(int id) async {
    await _repository.deleteTask(id);
    await loadTasks();
  }
}