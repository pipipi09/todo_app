import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/todos/todo_model.dart';

final inputTodoStateProvider = StateNotifierProvider.family
    .autoDispose<InputTodoState, TodoModel, TodoModel>(
  (_, TodoModel todo) => InputTodoState(todo),
);

class InputTodoState extends StateNotifier<TodoModel> {
  InputTodoState(TodoModel todo) : super(todo) {
    textEditingController.addListener(() {
      updateText(textEditingController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  final textEditingController = TextEditingController();

  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  void updateDate(int date) {
    state = state.copyWith(date: date);
  }
}
