import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_controller.dart';
import '../model/todo_model.dart';
import '../model/result/result.dart';
import 'repository.dart';

final todoRepositoryProvider =
    Provider<Repository<TodoModel>>((ref) => TodoRepositoryImpl());

class TodoRepositoryImpl implements Repository<TodoModel> {
  TodoRepositoryImpl();

  @override
  Future<Result<List<TodoModel>>> fetch({
    String? where,
    List? whereArgs,
  }) async {
    return Result.guardFuture(() async {
      final result = await DbController.db.get(
        tableName: TodoModel.tableName,
        where: where,
        whereArgs: whereArgs,
      );
      return result.map((e) => TodoModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Result<int>> save(TodoModel todo) async {
    return Result.guardFuture(
      () async => await DbController.db
          .create(tableName: TodoModel.tableName, json: todo.toJson()),
    );
  }

  @override
  Future<Result<int>> update(TodoModel todo) async {
    return Result.guardFuture(
      () async => await DbController.db.update(
        tableName: TodoModel.tableName,
        json: todo.toJson(),
        primaryKey: todo.id!,
      ),
    );
  }

  @override
  Future<Result<int>> delete(TodoModel todo) async {
    return Result.guardFuture(
      () async => await DbController.db.delete(
        tableName: TodoModel.tableName,
        primaryKey: todo.id!,
      ),
    );
  }
}
