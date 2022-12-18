import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/result/result.dart';
import '../models/todos/todo_model.dart';
import '../repository/repository.dart';
import '../repository/todo_repository_impl.dart';

/// Todoリストを日付ごとのMapにする
///
/// key: 日付
/// value: TodoのList
final dayTodoMapProvider =
    Provider.autoDispose<LinkedHashMap<DateTime, List<TodoModel>>>(
  (ref) {
    final todos =
        ref.watch(calendarTodoViewModelProvider).valueOrNull ?? <TodoModel>[];
    final mapedTodos =
        todos.fold<Map<DateTime, List<TodoModel>>>({}, (acc, todo) {
      final day =
          DateTime(todo.dateTime.year, todo.dateTime.month, todo.dateTime.day);
      if (acc.containsKey(day)) {
        acc[day]!.add(todo);
      } else {
        acc[day] = [todo];
      }
      return acc;
    });
    final linkedHashMap = LinkedHashMap<DateTime, List<TodoModel>>(
      equals: isSameDay,
      hashCode: (DateTime key) =>
          key.day * 1000000 + key.month * 10000 + key.year,
    )..addAll(mapedTodos);
    return linkedHashMap;
  },
);

/// Todoリストを取得し配布する
final calendarTodoViewModelProvider = StateNotifierProvider.autoDispose<
    CalendarTodoViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => CalendarTodoViewModel(
    ref.watch(todoRepositoryProvider),
  ),
);

/// カレンダーが持つtodoデータ
class CalendarTodoViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  /// constructor
  /// インスタンス生成時にloadを実行してデータを取得する
  CalendarTodoViewModel(this.todoRepository) : super(const AsyncData([])) {
    load();
  }

  /// todoRepository
  final Repository<TodoModel> todoRepository;

  /// 全件取得する
  Future<Result<List<TodoModel>>> load() async {
    final result = await todoRepository.fetch();
    return result.when(
      success: (data) {
        state = AsyncValue.data(data);
        return Result.success(data: data);
      },
      failure: (error) {
        state = AsyncValue.error(error);
        return Result.failure(error: error);
      },
    );
  }
}
