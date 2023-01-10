import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../view_models/calendar_completed_todo_view_model.dart';
import '../../view_models/calendar_todo_view_model.dart';
import '../../view_models/date_view_model.dart';
import '../../view_models/todo_view_model.dart';

class CalendarOrganism extends HookConsumerWidget {
  const CalendarOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(displayDateViewModelProvider);
    final todosMap = ref.watch(dayTodoMapProvider);
    final completedTodosMap = ref.watch(dayCompletedTodoMapProvider);
    var focusedDay = useState<DateTime>(date);
    var selectedDay = useState<DateTime>(date);
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay.value,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(selectedDay.value, day),
      onDaySelected: (selected, focused) {
        if (!isSameDay(selectedDay.value, selected)) {
          selectedDay.value = selected;
          focusedDay.value = focused;
          ref
              .read(displayDateViewModelProvider.notifier)
              .changeDate(selectedDay.value);
          ref
              .read(todoListViewModelProvider.notifier)
              .loadByDate(selectedDay.value);
        }
      },
      eventLoader: (day) {
        return todosMap[day] ?? [];
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.brown.shade100,
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.brown.shade300,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder:
            (BuildContext context, DateTime day, List<dynamic> events) {
          if (events.isEmpty) return null;
          final completed = completedTodosMap[day];
          if (completed != null &&
              events.every((todo) => completed.contains(todo.id!))) {
            return Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    child: Center(
                      child: Icon(
                        Icons.local_florist,
                        color: Colors.red.shade200,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange.shade100,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
