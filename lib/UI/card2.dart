import 'package:flutter/material.dart';
import '../api/myapi.dart';
import 'detail.dart';

class Ecran2 extends StatelessWidget {
  final MyAPI myAPI = MyAPI();

  Ecran2({super.key});

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
              color: Colors.white,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
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
      },
    );
  }
}
