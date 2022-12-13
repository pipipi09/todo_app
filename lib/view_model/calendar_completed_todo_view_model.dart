import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/completed_todos/completed_todo_model.dart';
import '../model/result/result.dart';
import '../repository/completed_todo_repository_impl.dart';
import '../repository/repository.dart';

/// CompletedTodoリストを日付ごとのMapにする
///
/// key: 日付
/// value: CompletedTodoModelのtodoIdのリスト
final dayCompletedTodoMapProvider =
    Provider.autoDispose<LinkedHashMap<DateTime, List<String>>>(
  (ref) {
    final completedTodos =
        ref.watch(calendarCompletedTodoViewModelProvider).valueOrNull ??
            <CompletedTodoModel>[];
    final mapedTodos = completedTodos.fold<Map<DateTime, List<String>>>({},
        (acc, completedTodo) {
      final day = DateTime(
        completedTodo.dateTime.year,
        completedTodo.dateTime.month,
        completedTodo.dateTime.day,
      );
      if (acc.containsKey(day)) {
        acc[day]!.add(completedTodo.todoId);
      } else {
        acc[day] = [completedTodo.todoId];
      }
      return acc;
    });
    final linkedHashMap = LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: (DateTime key) =>
          key.day * 1000000 + key.month * 10000 + key.year,
    )..addAll(mapedTodos);
    return linkedHashMap;
  },
);

/// CompletedTodoリストを取得し配布する
final calendarCompletedTodoViewModelProvider =
    StateNotifierProvider.autoDispose<CalendarCompletedTodoViewModel,
        AsyncValue<List<CompletedTodoModel>>>(
  (ref) => CalendarCompletedTodoViewModel(
    ref.watch(completedTodoRepositoryProvider),
  ),
);

/// カレンダーが持つcompleted_todoデータ
class CalendarCompletedTodoViewModel
    extends StateNotifier<AsyncValue<List<CompletedTodoModel>>> {
  /// constructor
  /// インスタンス生成時にloadを実行してデータを取得する
  CalendarCompletedTodoViewModel(this.completedTodoRepository)
      : super(const AsyncData([])) {
    load();
  }

  /// completedTodoRepository
  final Repository<CompletedTodoModel> completedTodoRepository;

  /// 全件取得する
  Future<Result<List<CompletedTodoModel>>> load() async {
    final result = await completedTodoRepository.fetch();
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
