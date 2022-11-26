import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../model/todo_model.dart';
import 'molecules/input_todo_molecule.dart';

class InputTodoOrganism extends ConsumerWidget {
  const InputTodoOrganism({required this.editTodo, super.key});

  final TodoModel editTodo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: InputTodoMolecule(
        todo: editTodo,
      ),
    );
  }
}
