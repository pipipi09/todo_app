import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_provider.dart';
import '../model/todo_model.dart';
import '../model/result/result.dart';
import 'todo_repository.dart';

final todoRepositoryProvider =
    Provider<TodoRepository>((ref) => TodoRepositoryImpl());

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl();

  @override
  Future<Result<List<Todo>>> fetch() async {
    return Result.guardFuture(() async {
      final result = await DbProvider.db.getAllTodos();
      return result;
    });
  }
}