import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../model/todo_model.dart';
import '../../../../../view_model/todo_view_model.dart';
import '../atoms/submit_btn_atom.dart';
import '../atoms/text_field_atom.dart';

class InputTodoMolecule extends ConsumerWidget {
  const InputTodoMolecule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoModel newTodo = TodoModel(date: DateTime.now().millisecondsSinceEpoch);
    return Column(
      children: [
        TextFieldAtom(
          label: 'Todo',
          onChanged: (String text) {
            newTodo = newTodo.copyWith(text: text);
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            Row(
              children: [
                Text('${newTodo.formatDate}'),
                IconButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: newTodo.dateTime,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      newTodo = newTodo.copyWith(
                        date: pickedDate.millisecondsSinceEpoch,
                      );
                    }
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
        SubmitBtnAtom(
          label: 'Save',
          onPressed: () {
            ref.read(todoListViewModelProvider.notifier).save(newTodo);
          },
        ),
      ],
    );
  }
}
