import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();

  static final DbController db = DbController._();

  static Database? _database;

  /// initDBをしてdatabaseを使用する
  Future<Database> get database async => _database ??= await initDB();

  /// initDB
  /// DataBaseのバージョンが違う場合はtableを作成する
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TodoApp.db");
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  /// tableを作成する
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

  /// tableにレコードをinsertする
  /// [json]はレコードの内容
  Future<int> createTodo(Map<String, Object?> json) async {
    final db = await database;
    return db.insert(_tableName, json);
  }

  /// tableから全てのデータを取得する
  Future<List<Map<String, Object?>>> getAllTodos() async {
    final db = await database;
    return db.query(_tableName);
  }

  /// tableのidに一致する[primaryKey]を指定してレコードをupdateする
  Future<int> updateTodo(Map<String, Object?> json, String primaryKey) async {
    final db = await database;
    return db.update(
      _tableName,
      json,
      where: "id = ?",
      whereArgs: [primaryKey],
    );
  }

  /// tableのidに一致する[id]を指定してレコードを削除する
  Future<int> deleteTodo(String id) async {
    final db = await database;
    var res = db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return res;
  }
}
