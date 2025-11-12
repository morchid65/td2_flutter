import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../ViewModel/taskViewModel.dart'; 
import 'detail.dart';
import 'task_form_screen.dart'; 

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) { 
    final List<Task> tasks = context.watch<TaskViewModel>().liste;
    final taskViewModel = context.read<TaskViewModel>();

    return Scaffold(
      body: tasks.isEmpty
          ? const Center(child: Text('Aucune tâche. Utilisez le bouton + pour en ajouter.'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final Task task = tasks[index];
                final String tags = task.tags.join(', ');

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: task.color.withOpacity(0.2), 
                  child: ListTile(
                    title: Text(task.title, style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text('ID: ${task.id} | Tags: $tags', style: Theme.of(context).textTheme.bodySmall),
                    
                    leading: Icon(Icons.assignment, color: task.color),
                    
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail(task: task)),
                      );
                    },
                    
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // TaskFormScreen est maintenant visible
                                builder: (context) => TaskFormScreen(taskToEdit: task)
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            taskViewModel.deleteTask(task.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  } 
}