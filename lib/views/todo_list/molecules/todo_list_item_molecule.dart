import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/completed_todos/completed_todo_model.dart';
import '../../../models/todos/todo_model.dart';
import '../../../view_models/completed_todo_view_model.dart';
import '../../../view_models/date_view_model.dart';
import '../../../view_models/todo_view_model.dart';
import '../organisms/input_todo_organism/input_todo_organism.dart';

class TodoListItemMolecule extends ConsumerWidget {
  const TodoListItemMolecule({
    super.key,
    required this.todo,
    this.completed,
  });

  final TodoModel todo;

  final CompletedTodoModel? completed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayingDate = ref.watch(displayDateViewModelProvider);
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
        leading: completed == null
            ? const Icon(Icons.circle_outlined)
            : const Icon(Icons.check_circle_outline_rounded),
        title: Text(
          todo.text!,
          style: TextStyle(
            color: completed == null ? Colors.black : Colors.grey,
            decoration: completed == null ? null : TextDecoration.lineThrough,
          ),
        ),
        onTap: () {
          if (completed == null) {
            if (todo.id == null || todo.id == '') return;
            final completedTodo = CompletedTodoModel(
              date: todo.date ?? displayingDate.millisecondsSinceEpoch,
              todoId: todo.id!,
            );
            ref
                .read(completedTodoListViewModelProvider.notifier)
                .save(completedTodo);
          } else {
            ref
                .read(completedTodoListViewModelProvider.notifier)
                .delete(completed!);
          }
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
