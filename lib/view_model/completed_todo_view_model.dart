import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/completed_todos/completed_todo_model.dart';
import '../models/result/result.dart';
import '../repository/completed_todo_repository_impl.dart';
import '../repository/repository.dart';
import 'date_view_model.dart';

final completedTodoListViewModelProvider = StateNotifierProvider<
    CompletedTodoListViewModel, AsyncValue<List<CompletedTodoModel>>>(
  (ref) => CompletedTodoListViewModel(
    ref.watch(completedTodoRepositoryProvider),
    ref.watch(displayDateViewModelProvider),
  ),
);

class CompletedTodoListViewModel
    extends StateNotifier<AsyncValue<List<CompletedTodoModel>>> {
  CompletedTodoListViewModel(this.completedTodoRepository, this.displayDate)
      : super(const AsyncData([])) {
    loadByDate(displayDate);
  }

  final Repository<CompletedTodoModel> completedTodoRepository;

  final DateTime displayDate;

  Future<Result<List<CompletedTodoModel>>> loadByDate(DateTime date) async {
    final startOfDate = DateTime(date.year, date.month, date.day);
    final endOfDate = DateTime(date.year, date.month, date.day, 23, 59);
    const where = "date between ? and ?";
    final whereArgs = [
      startOfDate.millisecondsSinceEpoch,
      endOfDate.millisecondsSinceEpoch
    ];
    final result =
        await completedTodoRepository.fetch(where: where, whereArgs: whereArgs);
    return result.when(
      success: (data) {
        state = AsyncValue.data(data);
        return Result.success(data: data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
        return Result.failure(error: error);
      },
    );
  }

  /// [completedTodo]を保存する
  Future<Result<int>> save(CompletedTodoModel completedTodo) async {
    const uuid = Uuid();
    if (completedTodo.id == null) {
      final saveData = completedTodo.copyWith(
        id: uuid.v4(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      final result = await completedTodoRepository.save(saveData);
      return result.when(
        success: (data) {
          loadByDate(saveData.dateTime);
          return Result.success(data: data);
        },
        failure: (error) {
          state = AsyncValue.error(error);
          return Result.failure(error: error);
        },
      );
    }
    throw const FormatException('completedTodo already has an id.');
  }

  /// [completedTodo]で指定したデータを削除する
  Future<Result<int>> delete(CompletedTodoModel completedTodo) async {
    final result = await completedTodoRepository.delete(completedTodo);
    return result.when(
      success: (data) {
        loadByDate(completedTodo.dateTime);
        return Result.success(data: data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
        return Result.failure(error: error);
      },
    );
  }
}
