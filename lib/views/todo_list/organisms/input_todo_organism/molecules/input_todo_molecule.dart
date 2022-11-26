import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../model/todo_model.dart';
import '../../../../../view_model/todo_view_model.dart';
import '../atoms/submit_btn_atom.dart';
import '../atoms/text_field_atom.dart';

class InputTodoMolecule extends HookConsumerWidget {
  const InputTodoMolecule({required this.todo, super.key});

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editTodo = useState(todo.copyWith());
    final textEditingController =
        TextEditingController(text: editTodo.value.text);

    return Column(
      children: [
        TextFieldAtom(
          label: 'Todo',
          controller: textEditingController,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            Row(
              children: [
                Text('${editTodo.value.formatDate}'),
                IconButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: editTodo.value.dateTime,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                    );

                    if (pickedDate != null) {
                      editTodo.value = editTodo.value.copyWith(
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
            editTodo.value =
                editTodo.value.copyWith(text: textEditingController.text);
            ref.read(todoListViewModelProvider.notifier).save(editTodo.value);
          },
        ),
      ],
    );
  }
}
