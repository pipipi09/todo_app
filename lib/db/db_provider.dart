import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static final DbProvider _instance = DbProvider._();

  factory DbProvider() {
    return _instance;
  }

  DbProvider._();

  final _dbName = 'todo_app.db';
  final _dbVersion = 1;
  late Database? _db;

  get db async {
    if (_db != null) return _db;
    _db = await _initDb();
    return _db;
  }

  Future _initDb() async {
    final Directory documentDirectory =
        await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion,
        onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE todos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT NOT NULL,
  date TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL)
''');
    });
  }
}
