import 'package:flutter/material.dart';
import '../models/task.dart';
import '../API/myapi.dart';
import 'detail.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Task>>(
        future: MyAPI().getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final List<Task> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final Task task = tasks[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  color: task.color.withOpacity(0.1),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text('Source: API Locale | Diff: ${task.difficulty}'),
                    leading: Icon(Icons.storage, color: task.color),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail(task: task)),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Aucune tâche trouvée dans le fichier JSON.'));
          }
        },
      ),
    );
  }
}