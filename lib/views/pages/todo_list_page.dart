import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/todo_model.dart';
import '../organisms/app_bar_organism.dart';
import '../todo_list/organisms/input_todo_organism/input_todo_organism.dart';
import '../todo_list/organisms/todo_list_organism.dart';
import 'calendar_page.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarOrganism(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalendarPage(),
            ),
          );
        },
      ),
      body: const SafeArea(
        child: TodoListOrganism(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return InputTodoOrganism(
                editTodo:
                    TodoModel(date: DateTime.now().millisecondsSinceEpoch),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
