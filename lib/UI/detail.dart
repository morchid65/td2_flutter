import 'package:flutter/material.dart';
import '../models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  const Detail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task ${task.title} detail')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCard(Icons.key, 'Identifiant', '${task.id}'),
            _buildCard(Icons.title, 'Titre de la tâche', task.title),
            _buildCard(Icons.description, 'Description de la tâche', task.description),
            _buildCard(Icons.attach_file, 'Tags associés', task.tags.join(" ")),
            _buildCard(Icons.trending_up, 'Difficulté', '${task.difficulty}'),
            _buildCard(Icons.schedule, "Nombre d'heures", '${task.nbhours}'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Card(
      color: task.color,
      elevation: 7,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

