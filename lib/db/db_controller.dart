import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/completed_todos/completed_todo_model.dart';
import '../model/repeats/repeat_model.dart';
import '../model/todos/todo_model.dart';
import '../utils/logger.dart';

class DbController {
  DbController._();

  static final DbController db = DbController._();

  static Database? _database;

  /// initDBをしてdatabaseを使用する
  Future<Database> get database async => _database ??= await initDB();

  static const dbName = "TodoApp.db";

  static final todosTableName = TodoModel.tableName;
  static final completedTodosTableName = CompletedTodoModel.tableName;
  static final repeatsTableName = RepeatModel.tableName;

  /// initDB
  /// DataBaseのバージョンが違う場合はtableを作成する
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return await openDatabase(
      path,
      version: 2,
      onCreate: _createTable,
      onUpgrade: _upgradeTabelV1toV2,
    );
  }

  /// tableを作成する
  Future<void> _createTable(Database db, int version) async {
    final batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS $dbName');
    batch.execute(
      "CREATE TABLE $todosTableName("
      "id TEXT PRIMARY KEY,"
      "text TEXT NOT NULL,"
      "date INTEGER NOT NULL,"
      "created_at INTEGER NOT NULL,"
      "updated_at INTEGER NOT NULL,"
      ");",
    );
    batch.execute(
      "CREATE TABLE $completedTodosTableName("
      "id TEXT PRIMARY KEY,"
      "date INTEGER NOT NULL,"
      "todo_id TEXT NOT NULL"
      "created_at INTEGER NOT NULL,"
      "updated_at INTEGER NOT NULL,"
      "FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE"
      ");",
    );
    batch.execute(
      "CREATE TABLE $repeatsTableName("
      "id TEXT PRIMARY KEY,"
      "todo_id TEXT NOT NULL"
      "frequency_id TEXT NOT NULL"
      "hour INTEGER"
      "minute INTEGER"
      "weekday INTEGER"
      "day INTEGER"
      "month INTEGER"
      "end INTEGER"
      "created_at INTEGER NOT NULL,"
      "updated_at INTEGER NOT NULL,"
      "FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE"
      ");",
    );
    await batch.commit();
  }

  FutureOr<void> _upgradeTabelV1toV2(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion == 1 && newVersion == 2) {
      final batch = db.batch();
      logger.i('database updgrade to $newVersion from $oldVersion');
      batch.execute("DROP TABLE IF EXISTS completed_todos");
      batch.execute(
        "CREATE TABLE completed_todos("
        "id TEXT PRIMARY KEY,"
        "date INTEGER NOT NULL,"
        "todo_id TEXT NOT NULL,"
        "created_at INTEGER NOT NULL,"
        "updated_at INTEGER NOT NULL,"
        "FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE"
        ");",
      );
      batch.execute("DROP TABLE IF EXISTS repeats");
      batch.execute(
        "CREATE TABLE repeats("
        "id TEXT PRIMARY KEY,"
        "todo_id TEXT NOT NULL,"
        "frequency_id TEXT NOT NULL,"
        "hour INTEGER,"
        "minute INTEGER,"
        "weekday INTEGER,"
        "day INTEGER,"
        "month INTEGER,"
        "end INTEGER,"
        "created_at INTEGER NOT NULL,"
        "updated_at INTEGER NOT NULL,"
        "FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE"
        ");",
      );
      await batch.commit();
      final version = await db.getVersion();
      logger.i('now database version is $version');
    }
  }

  /// tableにレコードをinsertする
  /// [json]はレコードの内容
  Future<int> create({
    required String tableName,
    required Map<String, Object?> json,
  }) async {
    final db = await database;
    return db.insert(tableName, json);
  }

  /// tableからデータを取得する
  /// [where]は id = ? のような形式にする
  /// [where]もしくは[whereArgs]がnullの場合は全件取得する
  Future<List<Map<String, Object?>>> get({
    required String tableName,
    String? where,
    List? whereArgs,
  }) async {
    final db = await database;
    if (where == null || whereArgs == null) {
      return db.query(tableName);
    }
    return db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  /// tableのidに一致する[primaryKey]を指定してレコードをupdateする
  Future<int> update({
    required String tableName,
    required Map<String, Object?> json,
    required String primaryKey,
  }) async {
    final db = await database;
    return db.update(
      tableName,
      json,
      where: "id = ?",
      whereArgs: [primaryKey],
    );
  }

  /// tableのidに一致する[primaryKey]を指定してレコードを削除する
  Future<int> delete({
    required String tableName,
    required String primaryKey,
  }) async {
    final db = await database;
    var res = db.delete(tableName, where: "id = ?", whereArgs: [primaryKey]);
    return res;
  }
}
