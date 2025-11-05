import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart'; 

class TaskRepository {
  static Database? _database;
  static const String tableName = 'tasks';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {

    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1, 
      onCreate: (db, version) {

        return db.execute(
          'CREATE TABLE $tableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title TEXT, '
          'tags TEXT, '
          'nbhours INTEGER, '
          'difficulty INTEGER, '
          'description TEXT, '
          'color INTEGER' 
          ')',
        );
      },
    );
  }

  Future<int> insertTask(Task task) async {
    final db = await database;

    return await db.insert(tableName, task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;

    return await db.update(
      tableName,
      task.toMap(), 
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}