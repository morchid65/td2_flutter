import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_app/models/task.dart';
import 'package:td2_app/ViewModel/taskViewModel.dart';
import 'detail.dart';

class Ecran1 extends StatelessWidget {
  const Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskViewModel>().liste;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final task = tasks[index];
        
        return Card(
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              child: Text(task.id.toString()),
            ),
            title: Text(task.title),
            subtitle: Text(task.tags.join(" ")),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(task: task),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}