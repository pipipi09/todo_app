import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/todo_model.dart';

/// DBにアクセスする
class DbController {
  DbController._();
  static final DbController db = DbController._();

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

  Future<int> createTodo(TodoModel todo) async {
    final db = await database;
    var res = await db.insert(_tableName, todo.toJson());
    return res;
  }

  Future<List<TodoModel>> getAllTodos() async {
    final db = await database;
    var res = await db.query(_tableName);
    final List<TodoModel> list = res.map((c) => TodoModel.fromJson(c)).toList();
    return list;
  }

  updateTodo(TodoModel todo) async {
    final db = await database;
    var res = await db.update(
      _tableName,
      todo.toJson(),
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
