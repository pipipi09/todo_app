import '../model/result/result.dart';

abstract class TodoRepository {
  Future<Result<int>> fetch();
}
