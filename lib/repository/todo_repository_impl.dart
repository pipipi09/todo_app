import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_controller.dart';
import '../model/todo_model.dart';
import '../model/result/result.dart';
import 'todo_repository.dart';

final todoRepositoryProvider =
    Provider<TodoRepository>((ref) => TodoRepositoryImpl());

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl();

  @override
  Future<Result<List<TodoModel>>> fetch() async {
    return Result.guardFuture(() async {
      final result = await DbController.db.getAllTodos();
      return result.map((e) => TodoModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Result<int>> save(TodoModel todo) async {
    return Result.guardFuture(
      () async => await DbController.db.createTodo(todo.toJson()),
    );
  }
}
