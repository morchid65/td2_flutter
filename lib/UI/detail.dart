// lib/UI/detail.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class Detail extends StatelessWidget {
  final Task task;
  const Detail({super.key, required this.task});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${task.id}'),
            Text('Hours: ${task.nbhours}'),
            Text('Difficulty: ${task.difficulty}'),
            Text(task.description),
          ],
        ),
      ),
    );
  }
}