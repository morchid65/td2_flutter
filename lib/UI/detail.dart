import 'package:flutter/material.dart';
import '../models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  const Detail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final Color bandColor = Colors.blue.shade700; 
    const TextStyle whiteText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    const TextStyle whiteSubtitle = TextStyle(color: Colors.white70);
    const Color whiteIcon = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text('Task ${task.title} detail'),
        backgroundColor: bandColor,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.key, color: whiteIcon), title: const Text('Identifiant', style: whiteText), subtitle: Text('${task.id}', style: whiteSubtitle))),
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.title, color: whiteIcon), title: const Text('Titre de la tache', style: whiteText), subtitle: Text(task.title, style: whiteSubtitle))),
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.description, color: whiteIcon), title: const Text('Description de la tache', style: whiteText), subtitle: Text(task.description, style: whiteSubtitle))),
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.attach_file, color: whiteIcon), title: const Text('Tags associés', style: whiteText), subtitle: Text(task.tags.join(" "), style: whiteSubtitle))),
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.trending_up, color: whiteIcon), title: const Text('Difficulté', style: whiteText), subtitle: Text('${task.difficulty} / 5', style: whiteSubtitle))),
            Card(color: bandColor, elevation: 4, child: ListTile(leading: const Icon(Icons.schedule, color: whiteIcon), title: const Text("Nombre d'heures", style: whiteText), subtitle: Text('${task.nbhours} h', style: whiteSubtitle))),
          ],
        ),
      ),
    );
  }
}