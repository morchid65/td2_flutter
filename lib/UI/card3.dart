import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';
import '../models/task.dart'; 

class Card3 extends StatefulWidget {
  const Card3({super.key});

  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: ListTile(
                    title: Text(post['title']),
                    subtitle: Text('Source: API REST | User ID: ${post['userId']}'),
                    leading: const Icon(Icons.cloud_download),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail(
                          task: Task(
                            id: post['id'], 
                            title: post['title'], 
                            tags: const ['REST', 'HTTP'], 
                            nbhours: 0, 
                            difficulty: 1, 
                            description: post['body'], 
                            color: Colors.purple
                          )
                        )),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Aucun post trouvé.'));
          }
        },
      ),
    );
  }
}