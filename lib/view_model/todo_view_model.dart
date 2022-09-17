import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/dummy_todos.dart';
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
        state = AsyncValue.data(dummyTodos);
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }
}
