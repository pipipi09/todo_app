import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/todo_model.dart';
import '../../../view_model/todo_view_model.dart';

class InputTodoOrganism extends ConsumerWidget {
  const InputTodoOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoModel newTodo = const TodoModel();
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
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Todo'),
            onChanged: (String text) {
              newTodo = TodoModel(text: text);
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Date'),
              Row(
                children: [
                  const Text('2022/07/22'),
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                    },
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
            ),
            onPressed: () {
              ref.read(todoListViewModelProvider.notifier).save(newTodo);
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
