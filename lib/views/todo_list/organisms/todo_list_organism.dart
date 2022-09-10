import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view_model/todo_view_model.dart';

class TodoListOrganism extends ConsumerWidget {
  const TodoListOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListViewModelProvider).valueOrNull ?? [];
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          leading: const Icon(Icons.circle_outlined),
          title: Text(todo.text ?? ''),
        );
      },
    );
  }
}
