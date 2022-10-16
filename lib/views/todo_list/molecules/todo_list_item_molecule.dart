import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../model/todo_model.dart';

class TodoListItemMolecule extends HookWidget {
  const TodoListItemMolecule({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final done = useState(false);
    return ListTile(
      leading: !done.value
          ? const Icon(Icons.circle_outlined)
          : const Icon(Icons.check_circle_outline_rounded),
      title: Text(
        todo.text!,
        style: TextStyle(
          color: !done.value ? Colors.black : Colors.grey,
          decoration: !done.value ? null : TextDecoration.lineThrough,
        ),
      ),
      onTap: () {
        done.value = !done.value;
      },
    );
  }
}
