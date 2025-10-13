import 'package:flutter/material.dart';
import 'models/task.dart';

class Detail extends StatelessWidget {
  final Task task;
  final List<Task> myTasks;

  const Detail({
    super.key,
    required this.task,
    required this.myTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tâche : ${task.title}'),
      ),
      body: ListView.builder(
        itemCount: myTasks.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: const Text('Description'),
                    subtitle: Text(task.description),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Heures'),
                    subtitle: Text('${task.nbhours}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Difficulté'),
                    subtitle: Text('${task.difficulty}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Tags'),
                    subtitle: Text(task.tags.join(', ')),
                  ),
                ),
              ],
            );
          } else {
            final myTask = myTasks[index - 1];
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
                subtitle: Text(myTask.tags.join(", ")),
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
