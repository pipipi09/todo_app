import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../model/result/result.dart';
import '../model/todo_model.dart';
import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';

/// Todoリストを取得し配布する
final todoListViewModelProvider =
    StateNotifierProvider<TodoListViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => TodoListViewModel(ref.watch(todoRepositoryProvider)),
);

/// Todoリスト
class TodoListViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  /// constructor
  /// インスタンス生成時にloadを実行してデータを取得する
  TodoListViewModel(this.todoRepository) : super(const AsyncData([])) {
    load();
  }

  /// todoRepository
  final TodoRepository todoRepository;

  /// データを取得する
  Future<Result<List<TodoModel>>> load() async {
    final result = await todoRepository.fetch();
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
          load();
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
          load();
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
        load();
        return Result.success(data: data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
        return Result.failure(error: error);
      },
    );
  }
}
