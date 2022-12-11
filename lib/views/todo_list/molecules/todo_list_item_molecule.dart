import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/todos/todo_model.dart';
import '../../../view_model/todo_view_model.dart';
import '../organisms/input_todo_organism/input_todo_organism.dart';

class TodoListItemMolecule extends ConsumerWidget {
  const TodoListItemMolecule({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            ref.read(todoListViewModelProvider.notifier).delete(todo);
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              ref.read(todoListViewModelProvider.notifier).delete(todo);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: ListTile(
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
              .save(todo.copyWith(done: todoDone));
        },
        trailing: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return InputTodoOrganism(editTodo: todo);
              },
            );
          },
          child: const Icon(Icons.create_rounded),
        ),
      ),
    );
  }
}
