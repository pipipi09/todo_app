import '../model/result/result.dart';
import '../model/todo_model.dart';

abstract class TodoRepository {
  Future<Result<List<TodoModel>>> fetch();
}
