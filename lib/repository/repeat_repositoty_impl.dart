import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../db/db_controller.dart';
import '../model/repeats/repeat_model.dart';
import '../model/result/result.dart';
import 'repository.dart';

final repeatRepositoryProvider =
    Provider<Repository<RepeatModel>>((ref) => RepeatRepository());

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
  Future<Result<int>> save(RepeatModel repeat) {
    return Result.guardFuture(
      () async => await DbController.db.create(
        tableName: RepeatModel.tableName,
        json: repeat.toJson(),
      ),
    );
  }

  @override
  Future<Result<int>> update(RepeatModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
