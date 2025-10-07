import 'package:flutter/material.dart';
import './models/task.dart';
import 'detail.dart';

class Ecran1 extends StatelessWidget {
  final List<Task> myTasks = Task.generateTasks(6);

  Ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              child: Text(myTasks[index].id),
            ),
            title: Text(myTasks[index].title),
            subtitle: Text(myTasks[index].tags.join(" ")),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      task: myTasks[index],
                      myTasks: myTasks,
                    ),
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
