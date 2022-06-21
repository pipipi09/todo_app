import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/todo_model.dart';

class DbProvider {
  DbProvider._();
  static final DbProvider db = DbProvider._();

  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TodoApp.db");
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return await db.execute(
      "CREATE TABLE todos("
      "id TEXT PRIMARY KEY,"
      "text TEXT NOT NULL,"
      "date INTEGER NOT NULL,"
      "done NUMERIC NOT NULL,"
      "created_at INTEGER NOT NULL,"
      "updated_at INTEGER NOT NULL"
      ")",
    );
  }

  static const _tableName = "todos";

  createTodo(Todo todo) async {
    final db = await database;
    var res = await db.insert(_tableName, todo.toMap());
    return res;
  }

  getAllTodos() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<Todo> list =
        res.isNotEmpty ? res.map((c) => Todo.fromMap(c)).toList() : [];
    return list;
  }

  updateTodo(Todo todo) async {
    final db = await database;
    var res = await db.update(
      _tableName,
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
    return res;
  }

  deleteTodo(String id) async {
    final db = await database;
    var res = db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return res;
  }
}
