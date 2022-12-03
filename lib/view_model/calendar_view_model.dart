import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/result/result.dart';
import '../model/todo_model.dart';
import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';
import 'date_view_model.dart';

/// Todoリストを日付ごとのMapにする
///
/// key: 日付
/// value: TodoのList
final dayTodoMapProvider =
    Provider.autoDispose<LinkedHashMap<DateTime, List<TodoModel>>>(
  (ref) {
    final todos =
        ref.watch(calendarViewModelProvider).valueOrNull ?? <TodoModel>[];
    final mapedTodos =
        todos.fold<Map<DateTime, List<TodoModel>>>({}, (acc, todo) {
      if (acc.containsKey(todo.dateTime)) {
        acc[todo.dateTime]!.add(todo);
      } else {
        acc[todo.dateTime] = [todo];
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
final calendarViewModelProvider =
    StateNotifierProvider<CalendarViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => CalendarViewModel(
    ref.watch(todoRepositoryProvider),
    ref.watch(dateViewModelProvider),
  ),
);

/// カレンダーが持つtodoデータ
class CalendarViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  /// constructor
  /// インスタンス生成時にloadを実行してデータを取得する
  CalendarViewModel(this.todoRepository, date) : super(const AsyncData([])) {
    load();
  }

  /// todoRepository
  final TodoRepository todoRepository;

  /// 1日分のデータを取得する
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
