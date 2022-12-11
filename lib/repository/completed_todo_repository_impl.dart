import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_controller.dart';
import '../model/completed_todos/completed_todo_model.dart';
import '../model/result/result.dart';
import 'repository.dart';

final completedRepositoryProvider = Provider<Repository<CompletedTodoModel>>(
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
  Future<Result<int>> delete(CompletedTodoModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<int>> save(CompletedTodoModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Result<int>> update(CompletedTodoModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
