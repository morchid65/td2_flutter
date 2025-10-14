import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'models/task.dart';

class Ecran2 extends StatefulWidget {
  @override
  _Ecran2State createState() => _Ecran2State();
}

class _Ecran2State extends State<Ecran2> {
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = loadTasks();
  }

Future<List<Task>> loadTasks() async {
    // Lire le fichier
    final String jsonString = await rootBundle.loadString('assets/tasks.json');

    // Décoder en Map<String,dynamic>
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    // Extraire la liste des tâches
    final List<dynamic> tasksList = jsonData['tasks'];

    // Transformer chaque élément en Task
    return tasksList.map((e) => Task.fromJson(e)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: _tasksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune tâche trouvée'));
        }
        final tasks = snapshot.data!;
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              color: task.color.withOpacity(0.2),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(
                  '${task.nbhours}h • Difficulté ${task.difficulty}',
                ),
                trailing: Wrap(
                  spacing: 8,
                  children: task.tags.map((t) => Chip(label: Text(t))).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}