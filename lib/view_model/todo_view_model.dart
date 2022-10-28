import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../model/todo_model.dart';
import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';

final todoListViewModelProvider =
    StateNotifierProvider<TodoListViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => TodoListViewModel(ref.watch(todoRepositoryProvider)),
);

class TodoListViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  TodoListViewModel(this.todoRepository) : super(const AsyncData([])) {
    load();
  }

  final TodoRepository todoRepository;

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
      throw const FormatException('primary key is not null');
    }
  }

  Future<void> update(TodoModel todo) async {
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
