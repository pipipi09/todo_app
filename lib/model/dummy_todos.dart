import 'todo_model.dart';

final dummyTodo = TodoModel(
  id: 'todo-1',
  text: '牛乳を買う',
  date: DateTime(2022, 9, 1, 10).millisecondsSinceEpoch,
);

final dummyTodos = List.generate(20, (_) => dummyTodo);
