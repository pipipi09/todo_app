import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/todo_model.dart';
import '../../../view_model/todo_view_model.dart';

class TodoListItemMolecule extends ConsumerWidget {
  const TodoListItemMolecule({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: todo.done == 0
          ? const Icon(Icons.circle_outlined)
          : const Icon(Icons.check_circle_outline_rounded),
      title: Text(
        todo.text!,
        style: TextStyle(
          color: todo.done == 0 ? Colors.black : Colors.grey,
          decoration: todo.done == 0 ? null : TextDecoration.lineThrough,
        ),
      ),
      onTap: () {
        final todoDone = todo.done == 0 ? 1 : 0;
        ref
            .read(todoListViewModelProvider.notifier)
            .update(todo.copyWith(done: todoDone));
      },
    );
  }
}
