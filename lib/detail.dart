import 'package:flutter/material.dart';
import 'models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  const Detail({super.key, required this.task});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Task ${task.title}'),
    ),
    body: ListView.builder(
      itemCount: myTasks.length + 1, // +1 to include the task details at the top
      itemBuilder: (context, index) {
        if (index == 0) {
          // Render the task details at the top
          return Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('Description'),
                  subtitle: Text(task.description),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Hours'),
                  subtitle: Text('${task.nbHours}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Difficulty'),
                  subtitle: Text('${task.difficulty}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Tags'),
                  subtitle: Text(task.tags.join(', ')),
                ),
              ),
            ],
          );
        } else {
          // Render the list of tasks
          final myTask = myTasks[index - 1]; // Adjust index for myTasks
          return Card(
            color: myTask.color,
            elevation: 7,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: myTask.color,
                child: Text(myTask.title[0]),
              ),
              title: Text(myTask.title),
              subtitle: Text(myTask.task.join(", ")),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          );
        }
      },
    ),
  );
}
}