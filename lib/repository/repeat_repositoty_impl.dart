import '../model/repeats/repeat_model.dart';
import '../model/result/result.dart';
import 'repository.dart';

class RepeatRepository implements Repository<RepeatModel> {
  RepeatRepository();

  @override
  Future<Result<int>> delete(RepeatModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<List<RepeatModel>>> fetch({String? where, List? whereArgs}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Result<int>> save(RepeatModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Result<int>> update(RepeatModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
