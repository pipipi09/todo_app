import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

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
  Future<void> load() async {
    final result = await todoRepository.fetch();
    result.when(
      success: (data) {
        state = AsyncValue.data(data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  /// [todo]を保存する
  /// primary keyがなければsave, あればupdateをする
  Future<void> save(TodoModel todo) async {
    const uuid = Uuid();
    if (todo.id == null) {
      final saveData = todo.copyWith(id: uuid.v4());
      final result = await todoRepository.save(saveData);
      result.when(
        success: (data) {
          load();
        },
        failure: (error) {
          state = AsyncValue.error(error);
        },
      );
    } else {
      final result = await todoRepository.update(todo);
      result.when(
        success: (data) {
          load();
        },
        failure: (error) {
          state = AsyncValue.error(error);
        },
      );
    }
  }

  /// [todo]で指定したデータを削除する
  Future<void> delete(TodoModel todo) async {
    final result = await todoRepository.delete(todo);
    result.when(
      success: (data) {
        load();
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }
}
