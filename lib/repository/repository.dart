import '../model/result/result.dart';

abstract class Repository<T> {
  Future<Result<List<T>>> fetch({
    String? where,
    List? whereArgs,
  });

  Future<Result<int>> save(T model);

  Future<Result<int>> update(T model);

  Future<Result<int>> delete(T model);
}
