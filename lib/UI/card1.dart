import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_app/models/task.dart';
import 'package:td2_app/ViewModel/taskViewModel.dart';
import 'detail.dart';
import 'task_form_screen.dart'; // Importez le formulaire

class Ecran1 extends StatelessWidget {
  const Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisation de watch pour écouter les changements
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
                // Navigation vers les détails au clic
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
            
            // Trailing pour les boutons d'action (Édition/Suppression)
            trailing: SizedBox(
              width: 100, // Espace pour les deux boutons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Bouton EDIT
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // Passer la tâche pour l'édition
                          builder: (context) => TaskFormScreen(taskToEdit: task),
                        ),
                      );
                    },
                  ),
                  // Bouton DELETE
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Confirmation de suppression
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirmation de suppression'),
                          content: Text('Voulez-vous vraiment supprimer la tâche "${task.title}" (ID: ${task.id}) ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Supprimer la tâche
                                taskViewModel.deleteTask(task.id!); 
                                Navigator.pop(context);
                              },
                              child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );
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