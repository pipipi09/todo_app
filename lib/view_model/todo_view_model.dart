import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../model/result/result.dart';
import '../model/todo_model.dart';
import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';
import 'date_view_model.dart';

/// Todoリストを取得し配布する
final todoListViewModelProvider =
    StateNotifierProvider<TodoListViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => TodoListViewModel(
    ref.watch(todoRepositoryProvider),
    ref.watch(dateViewModelProvider),
  ),
);

/// Todoリスト
class TodoListViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  /// constructor
  /// インスタンス生成時にloadを実行してデータを取得する
  TodoListViewModel(this.todoRepository, date) : super(const AsyncData([])) {
    loadByDate(date);
  }

  /// todoRepository
  final TodoRepository todoRepository;

  /// 1日分のデータを取得する
  Future<Result<List<TodoModel>>> loadByDate(DateTime date) async {
    final startOfDate = DateTime(date.year, date.month, date.day);
    final endOfDate = DateTime(date.year, date.month, date.day, 23, 59);
    const where = "date between ? and ?";
    final whereArgs = [
      startOfDate.millisecondsSinceEpoch,
      endOfDate.millisecondsSinceEpoch
    ];
    final result =
        await todoRepository.fetch(where: where, whereArgs: whereArgs);
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

  /// [todo]を保存する
  /// primary keyがなければsave, あればupdateをする
  Future<Result<int>> save(TodoModel todo) async {
    const uuid = Uuid();
    if (todo.id == null) {
      final saveData = todo.copyWith(id: uuid.v4());
      final result = await todoRepository.save(saveData);
      return result.when(
        success: (data) {
          return Result.success(data: data);
        },
        failure: (error) {
          state = AsyncValue.error(error);
          return Result.failure(error: error);
        },
      );
    } else {
      final result = await todoRepository.update(todo);
      return result.when(
        success: (data) {
          final now = DateTime.now();
          loadByDate(now);
          return Result.success(data: data);
        },
        failure: (error) {
          state = AsyncValue.error(error);
          return Result.failure(error: error);
        },
      );
    }
  }

  /// [todo]で指定したデータを削除する
  Future<Result<int>> delete(TodoModel todo) async {
    final result = await todoRepository.delete(todo);
    return result.when(
      success: (data) {
        final now = DateTime.now();
        loadByDate(now);
        return Result.success(data: data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
        return Result.failure(error: error);
      },
    );
  }
}
