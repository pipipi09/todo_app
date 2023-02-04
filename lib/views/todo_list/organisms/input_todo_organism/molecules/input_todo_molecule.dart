import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../const/frequencies.dart';
import '../../../../../models/repeats/repeat_model.dart';
import '../../../../../models/result/result.dart';
import '../../../../../models/todos/todo_model.dart';
import '../../../../../states/input_todo_state.dart';
import '../../../../../utils/logger.dart';
import '../../../../../view_models/date_view_model.dart';
import '../../../../../view_models/repeat_view_model.dart';
import '../../../../../view_models/todo_view_model.dart';
import '../../../../molecules/cupertino_picker_molecule.dart';
import '../atoms/submit_btn_atom.dart';
import '../atoms/text_field_atom.dart';

class InputTodoMolecule extends HookConsumerWidget {
  const InputTodoMolecule({required this.todo, super.key});

  final TodoModel todo;

  /// 入力したTodoを保存する
  Future<Result<String>> _saveTodo(WidgetRef ref, TodoModel todo) {
    return ref.read(todoListViewModelProvider.notifier).save(todo);
  }

  /// 繰り返し情報を保存する
  Future<Result<int>> _saveRepeat(WidgetRef ref, RepeatModel repeat) {
    return ref.read(repeatViewModelProvider.notifier).save(repeat);
  }

  /// モーダルを閉じる
  _closeModal(BuildContext context, WidgetRef ref) {
    final mounted = ref
        .read(
          todoListViewModelProvider.notifier,
        )
        .mounted;

    if (mounted) Navigator.pop(context);
  }

  /// カレンダーボタン押下
  _onPressedCalendarIcon(BuildContext context, WidgetRef ref) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: ref.read(inputTodoStateProvider(todo)).dateTime,
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      ref
          .read(inputTodoStateProvider(todo).notifier)
          .updateDate(pickedDate.millisecondsSinceEpoch);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var repeatStatus = useState(frequencies[0]);
    final inputTodoNotifier = ref.watch(inputTodoStateProvider(todo).notifier);
    final inputTodo = ref.watch(inputTodoStateProvider(todo));

    return Column(
      children: [
        TextFieldAtom(
          label: 'Todo',
          controller: inputTodoNotifier.textEditingController,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            Row(
              children: [
                Text(inputTodo.formatDate),
                IconButton(
                  onPressed: _onPressedCalendarIcon(context, ref),
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
                  onPressed: () async {},
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
            final todoResult = await _saveTodo(ref, inputTodo);

            todoResult.when(
              success: (todoId) {
                if (repeatStatus.value != Frequency.noRepeat.typeName) {
                  final repeat = RepeatModel(
                    todoId: todoId,
                    frequencyId: repeatStatus.value,
                  );
                  _saveRepeat(ref, repeat);
                }
                ref
                    .read(displayDateViewModelProvider.notifier)
                    .changeDate(inputTodo.dateTime);

                _closeModal(context, ref);
              },
              failure: (e) {
                logger.e(e);
              },
            );
          },
        ),
      ],
    );
  }
}
