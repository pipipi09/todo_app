import '../model/result/result.dart';
import '../model/todo_model.dart';

abstract class TodoRepository {
  Future<Result<List<TodoModel>>> fetch();

  Future<Result<int>> save(TodoModel todo);

  Future<Result<int>> update(TodoModel todo);

  Future<Result<int>> delete(TodoModel todo);
}
