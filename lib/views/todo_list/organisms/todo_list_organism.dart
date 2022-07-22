import 'package:flutter/material.dart';

import '../../../model/dummy_todos.dart';

class TodoListOrganism extends StatelessWidget {
  const TodoListOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyTodos.length,
      itemBuilder: (context, index) {
        final todo = dummyTodos[index];
        return ListTile(
          leading: const Icon(Icons.circle_outlined),
          title: Text(todo.text ?? ''),
        );
      },
    );
  }
}
