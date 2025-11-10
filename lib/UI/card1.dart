
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
    final taskViewModel = context.watch<TaskViewModel>();
    final tasks = taskViewModel.liste;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final task = tasks[index];
        
        return Card(
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(task: task),
                  ),
                );
            },
            leading: CircleAvatar(
              backgroundColor: task.color, 
              child: Text(task.id.toString()), 
            ),
            title: Text(task.title), 
            subtitle: Text(task.tags.join(" ")), 
            
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskFormScreen(taskToEdit: task),
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
          ),
        );
      },
    );
  }
}