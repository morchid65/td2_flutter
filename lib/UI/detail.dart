import 'package:flutter/material.dart';

import '../models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  const Detail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task ${task.title} detail')),
      body: Center(
        child: Column(
          children: [
            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.key)),
                title: const Text('Identifiant'),
                subtitle: Text('${task.id}'),
              ),
            ),
            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.title)),
                title: const Text('Titre de la tache'),
                subtitle: Text(task.title),
              ),
            ),
            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.description)),
                title: const Text('Description de la tache '),
                subtitle: Text(task.description),
              ),
            ),

            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.attach_file)),
                title: Text('Tags associés '),
                subtitle: Text(task.tags.join(" ")),
              ),
            ),

            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.trending_up)),
                title: const Text('Difficulté '),
                subtitle: Text('${task.difficulty}'),
              ),
            ),

            Card(
              color: task.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.schedule)),
                title: const Text("Nombre d'heures "),
                subtitle: Text('${task.nbhours}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}