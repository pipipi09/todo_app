import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view_model/completed_todo_view_model.dart';
import '../../../view_model/date_view_model.dart';
import '../../../view_model/todo_view_model.dart';
import '../molecules/todo_list_item_molecule.dart';

class TodoListOrganism extends ConsumerWidget {
  const TodoListOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayDate = ref.watch(displayDateViewModelProvider);
    final todos =
        ref.watch(todoListViewModelProvider(displayDate)).valueOrNull ?? [];
    final completedTodos =
        ref.watch(completedTodoListViewModelProvider).valueOrNull ?? [];
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        final completed = completedTodos
            .where((completedTodo) => completedTodo.todoId == todo.id);
        return TodoListItemMolecule(
          todo: todo,
          completed: completed.isNotEmpty ? completed.first : null,
        );
      },
    );
  }
}
