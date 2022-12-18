import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_controller.dart';
import '../models/completed_todos/completed_todo_model.dart';
import '../models/result/result.dart';
import 'repository.dart';

final completedTodoRepositoryProvider =
    Provider<Repository<CompletedTodoModel>>(
  (ref) => CompletedTodoRepositoryImpl(),
);

class CompletedTodoRepositoryImpl implements Repository<CompletedTodoModel> {
  CompletedTodoRepositoryImpl();

  @override
  Future<Result<List<CompletedTodoModel>>> fetch({
    String? where,
    List? whereArgs,
  }) async {
    return Result.guardFuture(() async {
      final result = await DbController.db.get(
        tableName: CompletedTodoModel.tableName,
        where: where,
        whereArgs: whereArgs,
      );
      return result.map((e) => CompletedTodoModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Result<int>> delete(CompletedTodoModel completedTodo) {
    return Result.guardFuture(
      () async => await DbController.db.delete(
        tableName: CompletedTodoModel.tableName,
        primaryKey: completedTodo.id!,
      ),
    );
  }

  @override
  Future<Result<int>> save(CompletedTodoModel completedTodo) {
    return Result.guardFuture(
      () async => await DbController.db.create(
        tableName: CompletedTodoModel.tableName,
        json: completedTodo.toJson(),
      ),
    );
  }

  @override
  Future<Result<int>> update(CompletedTodoModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
