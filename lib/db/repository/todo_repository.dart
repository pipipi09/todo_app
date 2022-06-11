import 'package:todo_app/db/db_provider.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoRepository {
  static String table = 'todos';
  static DbProvider dbProvider = DbProvider();

  static Future<Todo> insert(Todo todo) async {
    final db = await dbProvider.db;
    todo.id = await db.insert(table, todo.toMap());
    return todo;
  }

  Future<Todo?> get(id) async {
    final db = await dbProvider.db;
    List<Map> maps = await db.query(
      table,
      columns: ['id', 'text', 'date', 'done', 'createdAt', 'updatedAt'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(id) async {
    final db = await dbProvider.db;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    final db = await dbProvider.db;
    return await db
        .update(table, todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future close() async {
    final db = await dbProvider.db;
    db.close();
  }
}
