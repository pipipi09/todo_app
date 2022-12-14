import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../model/todos/todo_model.dart';
import '../../../../../view_model/date_view_model.dart';
import '../../../../../view_model/todo_view_model.dart';
import '../atoms/submit_btn_atom.dart';
import '../atoms/text_field_atom.dart';

class InputTodoMolecule extends HookConsumerWidget {
  const InputTodoMolecule({required this.todo, super.key});

  final TodoModel todo;

  static const repeatItems = [
    'no repeat',
    'every day',
    'every week',
    'every month',
    'every year',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editTodo = useState(todo.copyWith());
    var repeatStatus = useState(repeatItems[0]);
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
                Text(editTodo.value.formatDate),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Repeat'),
            Row(
              children: [
                Text(repeatStatus.value),
                IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CupertinoPicker(
                              itemExtent: 40,
                              children: repeatItems
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onSelectedItemChanged: (int index) {
                                repeatStatus.value = repeatItems[index];
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.repeat_rounded,
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SubmitBtnAtom(
          label: 'Save',
          onPressed: () async {
            editTodo.value =
                editTodo.value.copyWith(text: textEditingController.text);

            final result = await ref
                .read(todoListViewModelProvider.notifier)
                .save(editTodo.value);

            if (result.isSuccess) {
              ref
                  .read(displayDateViewModelProvider.notifier)
                  .changeDate(editTodo.value.dateTime);

              final mounted =
                  ref.read(todoListViewModelProvider.notifier).mounted;

              if (mounted) Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
