import '../API/myapi.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class Ecran3 extends StatelessWidget {
  final MyAPI myAPI = MyAPI();

  Ecran3({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myAPI.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune tâche trouvée.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final task = snapshot.data![index];
            return Card(
              color: Colors.lightGreenAccent,
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.task),
                title: Text(task.title),
                subtitle: Text(task.tags.join(", ")),
              ),
            );
          },
        );
      },
    );
  }
}
